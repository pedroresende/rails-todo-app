class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user[:id])
    @todos = @user.todos.order('title ASC').all
  end

  def hide
    @user = User.find_by(id: current_user[:id])
    @todo_list = @user.todo_lists.find_by(id: params[:id])
    @todos = Todo.order('id ASC').where(done: false).all
  end

  def check
    @todo = Todo.find_by(id: params[:id])
    @todo.update(done: true, due_date: DateTime.current)

    head :no_content
  end

  def uncheck
    @todo = Todo.find_by(id: params[:id])
    @todo.update(done: false)

    head :no_content
  end

  def new
    @user = User.find_by(id: current_user[:id])
    @todo = Todo.new
    @todo_list_id = params[:todo_list_id]
  end

  def create
    @user = User.find_by(id: current_user[:id])
    @todo = @user.todo_lists.find_by(id: params[:todo_list_id]).todos.create(todo_params)

    if @todo.save
      TodoMailer.with(user: @user, todo: @todo).new_todo.deliver_later
      redirect_to "/todo_lists/#{params[:todo_list_id]}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: current_user[:id])
    @todo = Todo.find(params[:id])
    @todo_lists_id = params[:todo_list_id]
  end

  def update
    @user = User.find_by(id: current_user[:id])
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to "/todo_lists/#{params[:todo_list_id]}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to "/todo_lists/#{params[:todo_list_id]}"
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :done, :due_date, :note, :remind_me)
  end
end
