class Public::RatesController < ApplicationController

  def create
    rate = Rate.new(rate_params)
    rate.save
  end

  private
  def rate_params
    params.require(:rate).permit(:rate)
  end

end
