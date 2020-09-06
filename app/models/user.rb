class User < ApplicationRecord
  has_many :items
  has_many :sold_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ン]+\z/ }
    validates :birthday_id, format: { with: /\A\d{4}[-]\d{2}[-]\d{2}\z/ }
  end
end
