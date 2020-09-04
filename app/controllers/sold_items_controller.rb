class SoldItemsController < ApplicationController
  # require "payjp"
  def index  
    @item =Item.find(params[:item_id])
    # binding.pry
    if @item.user.id == current_user.id
      redirect_to root_path 
    end

    @sold_item = SoldItem.new
    # @item =Item.find(params[:item_id])
  end
  
  def new
    
  end

  def create
    
    @item =Item.find(params[:item_id])
    @sold_item = SoldItem.new(order_params)
    if @sold_item.valid?
      # binding.pry
      pay_item
      # binding.pry
      @sold_item.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit( :item_id).merge(user_id: current_user.id)
    # params.permit(:token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_5b5837b1f44d0df569331e9d"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: params[:token],    # カードトークン
      # card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
