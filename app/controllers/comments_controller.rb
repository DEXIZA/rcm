class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to todo_path(@comment.todo)
    else     
      @todo = @comment.todo
      @comments = @todo.comments
      render "todos/show"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text,:image).merge(user_id: current_user.id, todo_id: params[:todo_id])
  end
end
