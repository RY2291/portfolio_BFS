class Public::RatesController < ApplicationController
before_action :authenticate_user!
  def create
    rate = current_user.rates.new(rate_params)
    rate.post_id = params[:post_id]
    # １つの投稿に対して評価をしているかどうか
    rate_count = Rate.where(post_id: params[:post_id]).where(user_id: current_user.id).count
    if rate.valid?
      if rate_count < 1
        rate.save
        redirect_to post_path(params[:post_id]), notice: "評価しました！"
      else
        flash.now[:alert] = "既に評価がされています"
        redirect_to post_path(params[:post_id])
      end
    end
  end
  
  
  private
  def rate_params
    params.require(:rate).permit(:rate)
  end

end
