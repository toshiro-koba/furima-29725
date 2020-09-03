require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品の出品' do
    context '出品がうまくいくとき' do
      it 'imageとitem_nameとdescription、category_id、status_id、cover_expense_id、area_id、delivery_time_id、priceが存在すれば、登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品がうまくいかないとき' do
      it 'imageが空では、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では、登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では、登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では、登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'status_idが空では、登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'cover_expense_idが空では、登録できない' do
        @item.cover_expense_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cover expense Select')
      end
      it 'area_idが空では、登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end
      it 'delivery_time_idが空では、登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time Select')
      end
      it 'priceが空では、登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Out of setting range', 'Price Half-width number')
      end
      it 'priceが300未満では、登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9999999超過では、登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceは全角数字では、登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceは英字では、登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
