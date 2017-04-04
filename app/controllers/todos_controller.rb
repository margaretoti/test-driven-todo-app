class TodosController < ApplicationController
  before_action :authenticate # see if we are signed in and if we are not then we will redirect to sign_in_path

  def index # if @todos is nil, set index method in controller
    @todos = Todo.where(owner_email: session[:current_email])
  end

  def new
    @todo = Todo.new # should create a Todo model - error is "unitialized constant Todo"
  end

  def create
    @todo = Todo.create(params.require(:todo).permit(:title).merge(owner_email: session[:current_email]))
    redirect_to root_path
  end
end
