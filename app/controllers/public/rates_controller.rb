class Public::RatesController < ApplicationController



  def create
    rate = current_user.rates.new(rate_params)
    post = params[:post_id]
    rate.post = post.id
    rate.save
  end
  private
  def rate_params
    params.require(:rate).permit(:rate, :post_id)
  end
