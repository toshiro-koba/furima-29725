class Item < ApplicationRecord
  belongs_to :user
  has_one :sold_item
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cover_expense
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_time

  validates :image, :item_name, :description, :category, :status, :cover_expense, :area, :delivery_time, :price, presence: true

  validates :category_id, :status_id, :cover_expense_id, :area_id, :delivery_time_id, numericality: { other_than: 1, message: 'Select' }

  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'Out of setting range', less_than_or_equal_to: 9_999_999 }

  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
end
