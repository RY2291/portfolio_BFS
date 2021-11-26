

RSpec.describe "Relationshipモデルのテスト", type: :model do
  describe "アソシエーションのテスト" do
    context "followingモデルとの関係" do
      it "1+Nとなっているか" do
        expect(Relationship.reflect_on_association(:following).macro).to eq :belongs_to
      end
    end
    
    context "followedモデルとの関係" do
      it "1+Nとなっているか" do
        expect(Relationship.reflect_on_association(:following).macro).to eq :belongs_to
      end
    end
  end
end