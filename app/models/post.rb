class Post < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy

  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  attachment :post_image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  validates :address, presence:true
end
