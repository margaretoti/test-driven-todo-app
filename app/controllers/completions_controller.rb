class CompletionsController < ApplicationController
  def create
    todo = current_user.todos.find(params[:todo_id]) # todo_completions path returns a todo_id
    todo.touch(:completed_at)

    redirect_to root_path
  end

  def destroy
    todo = current_user.todos.find(params[:todo_id])
    todo.completed_at = nil
    todo.save!

    redirect_to root_path
  end
end
