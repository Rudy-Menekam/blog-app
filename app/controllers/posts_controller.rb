class PostsController < ApplicationController
  protect_from_forgery prepend: true
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = @current_user.posts.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.commentscounter = 0
    @post.likescounter = 0
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_posts_path(@user)
        else
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
