class SoldItemsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index  
    
    if @item.user.id == current_user.id
      redirect_to root_path 
    end
    @sold_item = ItemSoldItem.new
  end
  
  def new
  end

  def create
    
    @sold_item = ItemSoldItem.new(order_params)
    if @sold_item.valid?
      pay_item
      @sold_item.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def order_params
    params.require(:item_sold_item).permit( :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item =Item.find(params[:item_id])
  end
end
