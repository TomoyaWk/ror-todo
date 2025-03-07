class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      @todos = Todo.all
      respond_to do |format|
        format.html { redirect_to todos_path }
        format.turbo_stream { render turbo_stream: turbo_stream.update("todos", partial: "todos/todos") }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      @todos = Todo.all
      respond_to do |format|
        format.html { redirect_to todos_path }
        format.turbo_stream { render turbo_stream: turbo_stream.update("todos", partial: "todos/todos") }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    @todos = Todo.all
    respond_to do |format|
      format.html { redirect_to todos_path }
      format.turbo_stream { render turbo_stream: turbo_stream.update("todos", partial: "todos/todos") }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :status)
  end
end
