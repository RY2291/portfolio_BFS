class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @comments = Comment.all.order(created_at: :desc)
  end
  
  def destroy
    Comment.find_by(id: params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_comments_path
  end
  
end
