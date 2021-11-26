# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do
  
  describe "バリデーションのテスト" do
    subject { post.valid? }
    
    let(:user) {create(:user) }
    let!(:post) { build(:post, user_id: user.id) }
    
    context "titleカラム" do
      it "空欄でないこと" do
        post.title = ""
        is_expected.to eq false
      end
    end
    
    context "introductionカラム" do
      it "空欄でないこと" do
        post.introduction = ""
        is_expected.to eq fale
      end
      it "５文字以上であること: 1文字は×" do
        post.introduction = Faker::Lorem.chracters(1)
        is_expected.to eq false
      end
      it "５文字以上であること: 2文字は×" do
        post.introduction = Faker::Lorem.chracters(2)
        is_expected.to eq false
      end
      it "５文字以上であること: 3文字は×" do
        post.introduction = Faker::Lorem.chracters(3)
        is_expected.to eq false
      end
      it "５文字以上であること: 4文字は×" do
        post.introduction = Faker::Lorem.chracters(4)
        is_expected.to eq false
      end
      it "５文字以上であること: 5文字はo" do
        post.introduction = Faker::Lorem.chracters(5)
        is_expected.to eq true
      end
      it "150文字以下であること: 150文字はo" do
        post.introduction = Faker::Lorem.chracters(150)
        is_expected.to eq true
      end
      it "150文字以上であること: 151文字は×" do
        post.introduction = Faker::Lorem.chracters(151)
        is_expected.to eq false
      end
    end
    
    context "addressカラム" do
      it "空欄でないこと" do
        post.address = ""
        is_expected.to eq false
      end
      it "住所が一意であること" do
        duplicate_post = post.dup
        duplicate_post.address = post.address.upcase
        post.save!
        is_expected.to be_invalid
      end
    end
  end
end