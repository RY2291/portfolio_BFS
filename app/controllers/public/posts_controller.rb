class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :new]
  # URLの直打された時の防止
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to posts_path, notice: "投稿が完了しました！"
    else
      render :new
    end
  end

  def index
    if selection = params[:keyword]
      @selected_posts = Post.sort(selection).page(params[:page]).per(9)
    else
      @posts = Post.all.page(params[:page]).per(9)
    end
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
       redirect_to post_path(@post.id), notice: "編集が完了しました！"
    else
      flash.now[:alert] = "編集に失敗しました。操作をやり直してください"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user), notice: "削除が完了しました！"
  end

  def search
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private
  def post_params
    # [ ]は複数画像idのため必要
    params.require(:post).permit(:title, :introduction, :address, :post_image, post_images_images: [])
  end

  def ensure_correct_user
    post = Post.find(params[:id])
    user = post.user
    redirect_to posts_path  if user_signed_in? && current_user.id != user.id
  end

end