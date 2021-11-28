class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    # 新しい順取得
    @comments = @post.comments.order(created_at: :desc)
    @rate = Rate.new
    @post_tags = @post.tags
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end


