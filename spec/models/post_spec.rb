# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Postモデルのテスト", type: :model do

  describe "バリデーションのテスト" do
    # subject { post.valid? }

    # let(:user) {create(:user) }
    # let!(:post) { build(:post, user_id: user.id) }
    
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
        @post.introduction = Faker::Lorem.characters(1)
        expect(@post.introduction).to eq false
      end
      it "５文字以上であること: 2文字は×" do
        post.introduction = Faker::Lorem.characters(2)
        expect(post.introduction).to be_invalid
      end
      it "５文字以上であること: 3文字は×" do
        post.introduction = Faker::Lorem.characters(3)
        expect(post.introduction).to be_invalid
      end
      it "５文字以上であること: 4文字は×" do
        post.introduction = Faker::Lorem.characters(4)
        expect(post.introduction).to be_invalid
      end
      it "５文字以上であること: 5文字はo" do
        post.introduction = Faker::Lorem.characters(5)
        expect(post.introduction).to eq true
      end
      it "150文字以下であること: 150文字はo" do
        post.introduction = Faker::Lorem.characters(150)
        expect(post.introduction).to eq true
      end
      it "150文字以上であること: 151文字は×" do
        post.introduction = Faker::Lorem.characters(151)
        expect(post.introduction).to eq false
      end
    end

    context "addressカラム" do
      it "空欄でないこと" do
        expect(@post.address).to_not eq ""
      end
      it "住所が一意であること" do
        duplicate_post = @post.dup
        duplicate_post.address = @post.address.upcase
        duplicate_post.save!
        expect(duplicate_post).to be_invalid
      end
    end
  end
end