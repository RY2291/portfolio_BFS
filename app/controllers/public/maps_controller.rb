class Public::MapsController < ApplicationController

  def index
  end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    # respond_toでリクエストされるフォーマット(js)に処理を分けることが
    # map.js.erbが変えるようになります。
    respond_to do |format|
     format.js
    end
  end

end
