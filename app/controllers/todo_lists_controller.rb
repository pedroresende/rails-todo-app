class TodoListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find_by(id: current_user[:id])
    @todo_lists = @user.todo_lists.order("title ASC").all
  end

  def show
    @user = User.find_by(id: current_user[:id])
    @todo_list = @user.todo_lists.find(params[:id])
    @todos = @todo_list.todos.all
    respond_to do |format|
      format.html
      format.json { render json: @todo_list }
    end
  end

  def new
    @user = User.find_by(id: current_user[:id])
    @users = User.all
    @todo_list = TodoList.new
  end

  def edit
    @user = User.find_by(id: current_user[:id])
    @todo_list = TodoList.find(params[:id])
  end

  def update
    @user = User.find_by(id: current_user[:id])
    @todo_list = TodoList.find(params[:id])

    if @todo_list.update(todos_list)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.find_by(id: current_user[:id])
    @todo_list = @user.todo_lists.create(todos_list)

    if todos_list[:user_id] != ""
      @new_user = User.find(todos_list[:user_id])
      @todo_list.users << @new_user
    end

    if @todo_list.save != nil
      # TodoMailer.with(user: @user, todo: @todo).new_todo.deliver_later
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_lists = TodoList.find(params[:id])
    @todo_lists.destroy

    redirect_to root_path, status: :see_other
  end


  private
  def todos_list
    params.require(:todo_list).permit(:title, :user_id)
  end
end
