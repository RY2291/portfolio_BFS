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
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  private
  def post_params
    #フォームが未完成のため、フォームを追加次第カラムを追加
    # [ ]は複数画像idのため必要
    params.require(:post).permit(:title, :introduction, :address, :post_image, post_images_images: [])
  end
  
end
