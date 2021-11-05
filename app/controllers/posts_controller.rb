class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user
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
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def post_params
    #フォームが未完成のため、フォームを追加次第カラムを追加
    params.require(:post).permit(:title, :introduction, :address,)
  end
  
end
