class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: "tag_id"
  has_many :posts, through: :tag_maps ,dependent: :destroy

  validates :tag_name, length: { maximum: 10 }


  # 投稿並び替え
  def self.sort(selection, tag_name)
    case selection
    when "new"
      return all.order(created_at: :DESC)
    when "old"
      return all.order(created_at: :ASC)
    when "likes"
      # return TagMap.select('posts.*', 'count(favorites.id) AS favorites').left_joins(:favorites).group('posts.id').order('favorites DESC')
      return find_by(tag_name: tag_name).posts.left_joins(:favorites).group('posts.id').order('count(favorites.post_id) DESC')
    when "dislikes"
      # return TagMap.select('posts.*', 'count(favorites.id) AS favorites').left_joins(:favorites).group('posts.id').order('favorites ASC')
      return find_by(tag_name: tag_name).posts.left_joins(:favorites).group('posts.id').order('count(favorites.post_id) ASC')
    end
  end
end
