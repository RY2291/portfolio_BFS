class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: "tag_id"
  has_many :posts, through: :tag_maps ,dependent: :destroy
  
  validates :tag_name, length: { maximum: 10 }
end
