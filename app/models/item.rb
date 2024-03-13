class Item < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 } 
  validates :status_id, presence: true, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :shipping_fee_id,presence: true, numericality: { other_than: 1 } 
  validates :prefecture_id, presence: true,numericality: { other_than: 1 } 
  validates :shipping_day_id, presence: true,numericality: { other_than: 1 } 
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
end