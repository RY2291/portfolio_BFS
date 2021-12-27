require 'rails_helper'

RSpec.describe "Posts", type: :request do

 describe "ログインしている" do
    before do
      @user = FactoryBot.create(:user)
    end
    context "新規投稿をする" do
      it "投稿できること" do
        sign_in @user
        get "/posts/new"
        expect(response).to have_http_status(200)
        post "/posts", params: { post: FactoryBot.attributes_for(:new_post_1) }
        follow_redirect!
        expect(response.body).to include "投稿が完了しました！"
      end
   end
 end
 
  describe "ログインしていない" do
    context "新規投稿する" do
      it "投稿に失敗する" do
        get "/posts/new"
        expect(response).to have_http_status(200)
        post "/posts", params: { post: FactoryBot.attributes_for(:new_post_1) }
        get "/user/sign_in"
        expect(response.body).to include "ログインもしくはアカウント登録してください。"
      end
    end
 end

end
