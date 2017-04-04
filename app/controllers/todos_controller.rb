class TodosController < ApplicationController
  before_action :authenticate # see if we are signed in and if we are not then we will redirect to sign_in_path

  def index # if @todos is nil, set index method in controller
    @todos = todos
  end

  def new
    @todo = Todo.new # should create a Todo model - error is "unitialized constant Todo"
  end

  def create
    todos.create(todo_params)
    # Todo.where(owber_email: current_email).create(todo_params)
    # Todo.create(todo_params.merge(owner_email: current_email)
    redirect_to root_path
  end

  private

  def todos # this is a scope
    @todos = Todo.where(owner_email: session[:current_email])
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
