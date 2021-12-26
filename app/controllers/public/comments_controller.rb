class Public::CommentsController < ApplicationController
before_action :authenticate_user!
  def create
    post = current_user.posts.find(params[:post_id])
    @comments = post.comments.order(created_at: :desc)
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = post.id
    if @comment.save
      flash[:notice] = "コメントが完了しました！"
    else
      render :error
    end
  end

  def destroy
    post = current_user.posts.find(params[:post_id])
    @comments = post.comments.order(created_at: :desc)
    Comment.find_by(id: params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
  end



  private
  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end
  
end
