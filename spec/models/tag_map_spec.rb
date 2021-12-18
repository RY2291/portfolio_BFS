# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "TagMapモデルのテスト" do

  describe "アソシエーションのテスト" do
    context "Postモデルとの関係" do
      it "１対Nであるか" do
        expect(TagMap.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context "Tagモデルとの関係" do
      it "１対Nであるか" do
        expect(TagMap.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
end