class PurchaserecordsController < ApplicationController
  before_action :move_to_signed_in, expect: [:index]
  
  def index
    @shipping_purchase = ShippingPurchase.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user|| @item.purchase_record != nil
      redirect_to root_path
      end
  end

  
 
  def create
    @shipping_purchase = ShippingPurchase.new(shipping_purchase_params)
    
    @item = Item.find(params[:item_id])
   
    if @shipping_purchase.valid?
      pay_item
      @shipping_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def shipping_purchase_params
    params.require(:shipping_purchase).permit(:price, :postal_code, :prefecture_id, :city, :phone_number, :building_name, :address).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
  Payjp::Charge.create(
    amount: @item.price, 
    card: shipping_purchase_params[:token],   
    currency: 'jpy'                
  )
  end
end



