class TodosController < ApplicationController
  def index # if @todos is nil, set index method in controller
    @todos = Todo.all
  end

  def new
    @todo = Todo.new # should create a Todo model - error is "unitialized constant Todo"
  end

  def create
    @todo = Todo.create(params.require(:todo).permit(:title))
    redirect_to root_path
  end
end
