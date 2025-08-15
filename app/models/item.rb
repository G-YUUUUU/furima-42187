class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :bearer
  belongs_to :ship_from_address
  belongs_to :shipping_time
  has_one_attached :image
  has_one :purchased_record

  validates :image, presence: true
  validates :item, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :bearer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_from_address_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_time_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }, format: { with: /\A[0-9]+\z/ }
end
