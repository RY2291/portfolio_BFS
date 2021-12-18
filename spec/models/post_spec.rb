# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do

  describe "バリデーションのテスト" do
    before do
      @post = FactoryBot.create(:post)
    end

    context "titleカラム" do
      it "空欄でないこと" do
        post = Post.new(title:"")
        expect(post).to be_invalid
      end
    end

    context "introductionカラム" do
      it "空欄でないこと" do
        expect(@post.title).to_not eq ""
      end
      it "５文字以上であること: 1文字は×" do
        introduction = Faker::Lorem.characters(number: 1)
        p = Post.new(introduction: introduction, user_id: 1)
        expect(p.valid?).to be_falsey
      end
      it "５文字以上であること: 2文字は×" do
        introduction = Faker::Lorem.characters(number: 2)
        p = Post.new(introduction: introduction, user_id: 2)
        expect(p.valid?).to be_falsey
      end
      it "５文字以上であること: 3文字は×" do
        introduction = Faker::Lorem.characters(number: 3)
        p = Post.new(introduction: introduction, user_id: 3)
        expect(p.valid?).to be_falsey
      end
      it "５文字以上であること: 4文字は×" do
        introduction = Faker::Lorem.characters(number: 4)
        p = Post.new(introduction: introduction, user_id: 4)
        expect(p.valid?).to be_falsey
      end
      it "５文字以上であること: 5文字はo" do
        introduction = Faker::Lorem.characters(number: 5)
        expect(introduction).to be_truthy
      end
      it "150文字以下であること: 150文字はo" do
        introduction = Faker::Lorem.characters(number: 150)
        expect(introduction).to be_truthy
      end
      it "150文字以上であること: 151文字は×" do
        introduction = Faker::Lorem.characters(number: 151)
        p = Post.new(introduction: introduction, user_id: 5)
        expect(p.valid?).to be_falsey
      end
    end

    context "addressカラム" do
      it "空欄でないこと" do
        expect(@post.address).to_not eq ""
      end
      it "住所が一意であること" do
        re_post = Post.new(address: "東京都渋谷区富ヶ谷1-49-3")
        expect(re_post).to be_invalid
      end
    end
  end
end