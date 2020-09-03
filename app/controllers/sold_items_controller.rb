class SoldItemsController < ApplicationController
end
class SoldItemsController < ApplicationController
  def index
    @sold_item = SoldItem.new(sold_item_params)
    @item =Item.find(params[:item_id])
    
  end

  def create
    if @sold_item.valid?
      pay_item
      @sold_item.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def sold_item_params
    params.permit(:price, :token).merge(item_id: current_item.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_5b5837b1f44d0df569331e9d"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: sold_item_params[:price],  # 商品の値段
      card: sold_item_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
