class PurchaserecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @shipping_purchase = ShippingPurchase.new
    @item = Item.find(params[:item_id])
  end

  
 
  def create
    @shipping_purchase = ShippingPurchase.new(shipping_purchase_params)
    @item = Item.find(params[:item_id])
    
    if @shipping_purchase.valid?
 
      @shipping_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

 
  def shipping_purchase_params
    params.require(:shipping_purchase).permit(:price, :postal_code, :prefecture_id, :city, :phone_number, :building_name, :address).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end



