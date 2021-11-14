class Public::RatesController < ApplicationController
before_action :authenticate_user!
  def create
    rate = current_user.rates.new(rate_params)
    rate.post_id = params[:post_id]
    if rate.save
      redirect_to post_path(params[:post_id])
    else
      flash[:notice] = "一つ以上は入力してください"
      redirect_to post_path(params[:post_id])
    end
  end
  
  
  private
  def rate_params
    params.require(:rate).permit(:rate)
  end

end
