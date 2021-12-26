class Public::UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "更新できました！"
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to _path, notice: "退会が完了しました!"
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email, :password, :password_confirmation, :current_password)
  end


end
