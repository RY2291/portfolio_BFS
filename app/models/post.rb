class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy
  has_many :post_images, dependent: :destroy

  accepts_attachments_for :post_images, attachment: :image
  attachment :post_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  validates :address, presence: true
  validates :title, presence: true
  validates :introduction, presence: true, length: { minimum: 5}




  def favorited_by?(user)
     return false if user.nil?
     favorites.where(user_id: user.id).exists?
  end


  # タグ作成メソッド
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグを削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    # 新しいタグをデータベースに保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      # self.post.tagsにnew_post_tagを追加
      self.tags << new_post_tag
    end
  end

  def self.sort(selection)
    case selection
    when "new"
      return all.order(created_at: :DESC)
    when "old"
      return all.order(created_at: :ASC)
    when "likes"
      return where(id: Favorite.group(:post_id).order(Arel.sql("count(post_id) desc")).pluck(:post_id))
    when "dislikes"
      return where(id: Favorite.group(:post_id).order(Arel.sql("count(post_id) asc")).pluck(:post_id))
    end
  end


end
