class ItemSoldItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :sold_item_id, :user_id, :item_id, :token

  validates :prefectures_id, :city, :address, :phone_number, :token, presence: true
  validates :phone_number, length: { maximum: 11, message: 'Input correctly' }
  validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
  VALID_POSTAL_CODE_REGEX =/\A\d{3}[-]\d{4}\z/
  validates :postal_code, presence: true,
            format: { with: VALID_POSTAL_CODE_REGEX,
              message: 'Input correctly' }

  def save
    sold_item = SoldItem.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, sold_item_id: sold_item.id)
  end
end
