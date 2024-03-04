class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :shipping_free_id,presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true

  has_many :item_users
  has_many :users, through: :item_users
  has_many :messages
end
