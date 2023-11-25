class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :burden_id, presence: true
  validates :area_id, presence: true
  validates :delivery_id, presence: true
  validates :price, presence: true
  
end
