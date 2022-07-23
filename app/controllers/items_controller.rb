class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
  end
end

  def update
   @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :price, :product_name, :description_of_item, :category_id, :product_condition_id,
                                 :prefecture_id, :burden_of_shipping_charge_id, :shipping_day_id, :user_id).merge(user_id: current_user.id)
  end
end

