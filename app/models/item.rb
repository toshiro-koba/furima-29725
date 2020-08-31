class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category, :status, :cover_expenses, :area, :delivery_time

  validates :item_name, :description, :category, :status, :cover_expenses, :area, :delivery_time, :price, presence: true
  #リファレンス型のuserも入れる？

  validates :category_id, :status_id, :cover_expenses_id, :area_id, :delivery_time_id, numericality: { other_than: 1}


end
