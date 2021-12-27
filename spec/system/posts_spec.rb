require 'rails_helper'

describe "Posts", type: :system do
  describe "投稿機能" do
    let(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }
    
    before do
      visit  new_user_session_path
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
    
    describe "投稿一覧画面のテスト" do
      before do
        visit posts_path
      end
      
      context "表示内容の確認" do
        it "URLが正しいか" do
          expect(current_path).to eq "/posts"
        end
        
        it "投稿詳細ページへのリンク先が正しいか"do 
          expect(page).to have_link "", href: post_path(post.id)
        end
        
        it "titleが表示されているか" do
          expect(page).to have_content post.title
        end
        
        it "introductionが表示されているか" do
          expect(page).to have_content post.introduction
        end
        
        it "ユーザー名が表示されているか" do
          expect(page).to have_content user.name
        end
        
        it "画像は表示されているか" do
          expect(page).to have_content post.post_image_id
        end
        
        it "投稿日時は表示されているか" do
          expect(page).to have_content post.created_at
        end
        
      end
    end
  end
end