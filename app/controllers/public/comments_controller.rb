class Public::CommentsController < ApplicationController

  def create
    post = Post.find(params[:id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      flash[:notice] = "コメントが完了しました！"
      redirect_to post_path(post.id)
    else
      flash[:notice] = "コメントに失敗しました"
      redirect_back(fallback_location: top_path)
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_back(fallback_location: top_path)
  end



  private
  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end


end
