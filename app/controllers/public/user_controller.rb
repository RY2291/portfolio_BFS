class Public::UserController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "更新できました！"
      redirect_to(user_path(current_user))
    else
      flash[:notice] = "更新に失敗しました"
      redirect_back(fallback_location: top_path)
    end
  end
  
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会が完了しました!"
    redirect_to top_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email, :password, :password_confirmation, :current_password)
  end
  
  
end