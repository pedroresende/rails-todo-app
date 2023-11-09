class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user[:id])
    @todos = @user.todos.order("title ASC").all
  end

  def hide
    @user = User.find_by(id: current_user[:id])
    @todos = Todo.order('id ASC').where(done: false).all
  end

  def check
    @todo = Todo.find_by(id: params[:id])
    return unless @todo.update(done: true, due_date: DateTime.current)

    head :ok, status: 200
  end

  def uncheck
    @todo = Todo.find_by(id: params[:id])
    return unless @todo.update(done: false)

    head(:ok)
  end

  def new
    @user = User.find_by(id: current_user[:id])
    @todo = Todo.new
  end

  def create
    @user = User.find_by(id: current_user[:id])
    @todo = @user.todos.create(todo_params)

    if @todo.save
      TodoMailer.with(user: @user, todo: @todo).new_todo.deliver_later
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: current_user[:id])
    @todo = Todo.find(params[:id])
  end

  def update
    @user = User.find_by(id: current_user[:id])
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :done, :due_date, :note, :remind_me)
  end
end
