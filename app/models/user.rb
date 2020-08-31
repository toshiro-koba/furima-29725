class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

        validates :nickname, presence: true
        # validates :email, presence: true
        with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
          validates :password
        end
        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
          validates :family_name, :first_name
        end
        with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
          validates :family_name_kana, :first_name_kana
        end
        validates :birthday_id, presence: true ,length: { is: 8 }
end
