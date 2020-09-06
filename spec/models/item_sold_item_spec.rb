require 'rails_helper'

RSpec.describe ItemSoldItem, type: :model do
  describe '商品の購入' do
    before do
      @sold_item = FactoryBot.build(:item_sold_item)
    end
    context '購入がうまくいくとき' do
      it 'tokenとpostal_codeとprefectures_id、city、address、phone_numberが存在すれば、購入できる' do
        expect(@sold_item).to be_valid
      end
    end
    context '出品がうまくいかないとき' do
      it 'tokenが空では、購入できない' do
        @sold_item.token = ""
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では、購入できない' do
        @sold_item.postal_code = ""
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていない場合、購入できない' do
        @sold_item.postal_code = "1234567"
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefectures_idが空では、購入できない' do
        @sold_item.prefectures_id = 1
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Prefectures Select")
      end
      it 'cityが空では、購入できない' do
        @sold_item.city = ""
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では、購入できない' do
        @sold_item.address = ""
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では、購入できない' do
        @sold_item.phone_number = ""
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれている場合、購入できない' do
        @sold_item.phone_number = "090-1234-5678"
        @sold_item.valid?
        expect(@sold_item.errors.full_messages).to include("Phone number Input correctly")
      end

      
    end
  end
end
