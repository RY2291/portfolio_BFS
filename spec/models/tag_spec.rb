

RSpec.describe "Tagモデルのテスト" do
  describe "バリデーションのテスト" do
    
    subject { tag.valid? }
    
    let(:tag_map) { create(:tag_map) }
    let!(:post) { build(:post, user_id: user.id) }
    
    context "tag_nameカラム" do
      it "10文字以下であること: 10文字はo" do
        tag.tag_name = Faker::Lorem.chracters(10)
        is_expected.to eq true
      end
      it "10文字以下であること: 11文字はx" do
        ttag.tag_name = Faker::Lorem.chracters(11)
        is_expected.to eq false
      end
    end
  end
end