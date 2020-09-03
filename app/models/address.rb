class Address < ApplicationRecord
  belongs_to :sold_item

  validates :prefectures, :city, :address, :presence, true
  validates :phone_number, numericality: { only_integer: true }
  # 電話番号の桁数もバリデーションする！！
  validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end
end

