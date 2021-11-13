class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が完了しました！"
      redirect_to posts_path
    else
      flash[:notice] = "投稿に失敗しました"
      redirect_back(fallback_location: top_path)
    end
  end

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
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  private
  def post_params
    #フォームが未完成のため、フォームを追加次第カラムを追加
    # [ ]は複数画像idのため必要
    params.require(:post).permit(:title, :introduction, :address, :post_image, :rate, post_images_images: [])
  end

end