class TagMap < ApplicationRecord
  
  belongs_to :post
  belongs_to :tag, dependent: :destroy
end
