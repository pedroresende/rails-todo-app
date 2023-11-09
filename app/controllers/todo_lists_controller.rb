class TodoListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find_by(id: current_user[:id])
    @todo_lists = @user.todo_lists.order("title ASC").all
  end

  def show
    @user = User.find_by(id: current_user[:id])
    @todos = @user.todo_lists.find(params[:id]).todos.all
  end

  def new
    @user = User.find_by(id: current_user[:id])
    @users = User.all
    @todo = TodoList.new
  end

  def edit
    @user = User.find_by(id: current_user[:id])
    @todo_list = TodoList.find(params[:id])
  end

  def create
    @user = User.find_by(id: current_user[:id])
    puts params[:title]
    puts params[:todo_list[:user_id]]
    # @todo_list = @user.todo_lists.create(todos_list)
    if @todo_list.save
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
