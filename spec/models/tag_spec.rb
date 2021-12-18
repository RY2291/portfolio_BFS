require 'rails_helper'

RSpec.describe "Tagモデルのテスト" do
  describe "バリデーションのテスト" do
    context "tag_nameカラム" do
      it "10文字以下であること: 10文字はo" do
        tag = Faker::Lorem.characters(number: 10)
        expect(tag).to be_truthy
      end

      it "10文字以下であること: 11文字はx" do
        tag = Faker::Lorem.characters(number: 11)
        t = Tag.new(tag_name: tag)
        expect(t.valid?).to be_falsey
      end
    end
  end
end