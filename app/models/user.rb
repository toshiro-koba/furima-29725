class User < ApplicationRecord
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
    validates :password
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :family_name, :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :family_name_kana, :first_name_kana
  end
  with_options presence: true, format: { with: /\A\d{4}[-]\d{2}[-]\d{2}\z/ } do
    validates :birthday_id
  end
end
