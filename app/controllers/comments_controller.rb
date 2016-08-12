class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to post_path(@comment.post)
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
