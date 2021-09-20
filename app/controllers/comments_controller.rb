class CommentsController < ApplicationController
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

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, todo_id: params[:todo_id])
  end
end
