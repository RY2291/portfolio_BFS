# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe "バリデーションのテスト" do

    # テストしたいオブジェクト
    subject { user.valid? }

    let!(:other_user) { create(:user) }  # 即時評価
    let(:user) { build(:user) }   # 遅延評価

    context "nameカラム" do
      it "空欄でないこと" do
        user.name = ""
        is_expected.to eq false
      end

      it "名前に一意性があること" do
        user.name = "other_user.name"
        is_expected.to eq false

      end
    end

  end
end