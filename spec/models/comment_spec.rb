# frozen_string_literal: true

#require 'rails_helper'

RSpec.describe "Commentモデルのテスト", type: :model do
  describe "バリデーションのテスト" do

    subject { comment.valid? }
      let!(:user) { create(:user) }
      let!(:post) { create(:post, user_id: user.id) }
      let(:comment) { build(:comment, user_id: user.id, post_id: post.id) }

    context "commentカラム" do
      it "空欄でないこと" do
        comment.comment = ""
        is_expected(comment.comment).to be("")
      end

      it "2文字以上であること: 1文字は×" do
        comment.comment = Faker::Lorem.chracters(number: 1)
        is_expected.to eq false
      end

      it "2文字以上であること: 2文字はo" do
        comment.comment = Faker::Lorem.chracters(number: 2)
        is_expected.to eq true
      end

      it "150文字以下であること: 150文字はo" do
        comment.comment = Faker::Lorem.chracters(number: 150)
        is_expected.to eq true
      end

      it "150文字以下であること: 151文字はx" do
        comment.comment = Faker::Lorem.chracters(number: 151)
        is_expected.to eq false
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