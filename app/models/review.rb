class Review < ActiveRecord::Base
  has_many :products
  has_many :users

  validates :description, presence: true
  validates :rating, presence: true
end
