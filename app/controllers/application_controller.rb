class ApplicationController < ActionController::Base
  def index
    @todos = Todo.order("id ASC").all
  end

  def hide
    @todos = Todo.order("id ASC").where(done: false).all
  end

  def check
    @todo = Todo.find_by(id: params[:id])
    if @todo.update(done: true)
      head :ok, status: 200
    end
  end

  def uncheck
    @todo = Todo.find_by(id: params[:id])
    if @todo.update(done: false)
      head(:ok)
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to root_path, status: :see_other

  end

  private
  def todo_params
    params.permit(:title, :done, :due_date)
  end

end
