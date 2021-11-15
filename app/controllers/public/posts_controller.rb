class Public::PostsController < ApplicationController

  before_action :ensure_correct_user, { only: [:create, :edit, :update, :destroy, :new] }

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      flash[:notice] = "投稿が完了しました！"
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
    @tag = Tag.all

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

  def edit
    @post = Post.find(params[:id])
    @post_tag = @post.tags
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
       @post.save_tag(tag_list)
       redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  def search
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private
  def post_params
    #フォームが未完成のため、フォームを追加次第カラムを追加
    # [ ]は複数画像idのため必要
    params.require(:post).permit(:title, :introduction, :address, :post_image, post_images_images: [])
  end

  def ensure_correct_user
    return if user_signed_in? && current_user.id == user.id

    redirect_to posts_path
  end

end