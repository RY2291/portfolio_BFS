class Public::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comments = post.comments.order(created_at: :desc)
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:notice] = "コメントが完了しました！"
    else
      flash[:notice] = "コメントに失敗しました。１文字以上入力してください"
      redirect_back(fallback_location: top_path)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @comments = post.comments.order(created_at: :desc)
    Comment.find_by(id: params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
  end



  private
  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end


end
