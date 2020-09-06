class ItemsController < ApplicationController
  before_action :set_all_items, only: [:index]
  before_action :set_item, only: [:show]
  before_action :set_all_sold_items, only: [:index, :show]
  before_action :check_if_sold, only: [:show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :cover_expense_id, :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_all_items
    @items = Item.all
    # @items = Item.all.order("created_at DESC")  降順のパターン
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_all_sold_items
    @sold_items = SoldItem.all
  end

  def check_if_sold
    @check_if_sold = 0
    @sold_items.each do |sold_item|
      if @item.id == sold_item.item.id
        @check_if_sold = 1
        return
      end
    end
  end
end
