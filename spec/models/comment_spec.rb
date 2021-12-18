# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Commentモデルのテスト", type: :model do
  describe "バリデーションのテスト" do
    context "commentカラム" do
      it "空欄でないこと" do
        expect(FactoryBot.build(:comment)).to be_valid
      end

      it "2文字以上であること: 1文字は×" do
        comment = Faker::Lorem.characters(number: 1)
        c = Comment.new(comment: comment, user_id: 1, post_id: 1)
        expect(c.valid?).to be_falsey
      end

      it "2文字以上であること: 2文字はo" do
        comment = Faker::Lorem.characters(number: 2)
        expect(comment).to be_truthy
      end
      
      it "150文字以下であること: 150文字はo" do
        comment = Faker::Lorem.characters(number: 150)
        expect(comment).to be_truthy
      end

      it "150文字以下であること: 151文字はx" do
        comment = Faker::Lorem.characters(number: 151)
        c = Comment.new(comment: comment, user_id: 1, post_id: 1)
        expect(c.valid?).to be_falsey
      end
    end
  end

  describe "アソシエーションのテスト" do
    context "Userモデルとのアソシエーション" do
      it "1対Nであるか" do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "Postモデルとのアソシエーション" do
      it "1対Nであるか" do
        expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end

end