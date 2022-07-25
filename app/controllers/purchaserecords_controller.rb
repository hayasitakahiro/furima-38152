class PurchaserecordsController < ApplicationController

  def index
   
    @shipping_purchase = ShippingPurchase.new #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  

 
  def create
    binding.pry
  end


end
