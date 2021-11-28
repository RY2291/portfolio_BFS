# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe "バリデーションのテスト" do
    
    before do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.create(:user)
    end
    

    context "nameカラム" do
      it "空欄でないこと" do
        #@user.name = ""
        expect(@user.name).to_not eq ""
      end

      it "名前に一意性があること" do
        @user.name = @other_user.name
        expect(@user.valid?).to eq false
      end
    end

  end
end