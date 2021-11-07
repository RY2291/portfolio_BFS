class Public::RelationshipsController < ApplicationController

  def create
    #引数にフォローするuser_idと誰がフォローするかをUserモデルのfollow関数へ
    current_user.follow(params[:user_id], current_user.id)
    redirect_back(fallback_location: top_path)
  end

  def destroy
    #byebug
    current_user.unfollow(params[:user_id], current_user.id)
    redirect_back(fallback_location: top_path)
  end
  
  def follow
    @following = User.find(params[:id]).followings.where.not(id: current_user.id)
    @followers =  User.find(params[:id]).followers.where.not(id: current_user.id)
  end

end
