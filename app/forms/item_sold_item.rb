class ItemSoldItem

  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number,:sold_item_id, :user_id, :item_id

  validates :prefectures_id, :city, :address, :phone_number, presence: true
  validates :phone_number, length: { maximum: 11 }
  validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end

  def save
    sold_item = SoldItem.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, sold_item_id: sold_item.id)
  end

end

