class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:id])
    p post.text
    @comment = current_user.comments.new(
      author_id: current_user.id,
      post_id: post.id,
      text: comment_params
    )

    @comment.save if @comment.valid?
    redirect_to user_post_path(current_user, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
