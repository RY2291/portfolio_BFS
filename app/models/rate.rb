class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :rate, presence: true
end
