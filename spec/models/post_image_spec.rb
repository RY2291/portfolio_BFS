RSpec.describe "PostImageモデルのテスト" do
  context "Postモデルとのアソシエーション" do
    it "1対Nであるか" do
      expect(PostImage.reflect_on_association(:post).macro).to eq :belongs_to
    end
  end
end