# frozen_string_literal: true

#require 'rails_helper'

RSpec.describe "Favoriteモデルのテスト", type: :model do
  describe "アソシエーションのテスト"do
    context "Userモデルとのアソシエーション" do
      it "1対Nであるか" do
        #binding.pry
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Postモデルとのアソシエーション" do
      it "1対Nであるか" do
        expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end