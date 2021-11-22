class Public::RelationshipsController < ApplicationController
before_action :authenticate_user!
  def create
    #引数にフォローするuser_idと誰がフォローするかをUserモデルのfollow関数へ
    current_user.follow(params[:user_id], current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    #byebug
    current_user.unfollow(params[:user_id], current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def follow
    @followings = User.find(params[:user_id]).followings.where.not(id: current_user.id)
    @followers =  User.find(params[:user_id]).followers.where.not(id: current_user.id)
    @user = User.find(params[:user_id])
  end

end
