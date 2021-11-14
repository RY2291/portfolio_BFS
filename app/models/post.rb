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


  validates :address, presence:true



  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    #byebug
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

  
  
end
