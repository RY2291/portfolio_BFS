class Public::RatesController < ApplicationController

  def create
    rate = current_user.rates.new(rate_params)
    rate.post_id = params[:post_id]
    rate.save
    redirect_to post_path(params[:post_id])
  end
  
  
  private
  def rate_params
    params.require(:rate).permit(:rate)
  end

end
