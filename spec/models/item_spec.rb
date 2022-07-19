require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end
describe '商品出品' do
  context '商品出品できるとき' do
    it 'category,、product_condition、prefecture、burden_of_shipping_charge、shipping_day、product_name、
    price、image、が存在すれば出品できる' do
      expect(@item).to be_valid
    end
  end
end


it 'category_idがない場合は出品できない' do
  @item.category_id = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Category can't be blank"
end
it 'product_condition_idがない場合は出品できない' do
  @item.product_condition_id, = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Product_condition_id can't be blank"
end
it 'prefecture_idが空では登録できない' do
  @item.prefecture_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Prefecture_id can't be blank"
end
it 'burden_of_shipping_charge_idがない場合は出品できないこと' do
  @item.burden_of_shipping_charge_id = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Burden_of_shipping_charge_id can't be blank"
end
it 'shipping_day_idがない場合は出品できないこと' do
  @item.shipping_day_id = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Shipping_day_id can't be blank"
end
it 'product_nameがない場合は出品できないこと' do
  @item.product_name = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Product_name can't be blank"
end
it 'priceがない場合は出品できないこと' do
  @item.price, = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Price can't be blank"
end
it 'imageがない場合は出品できないこと' do
  @item.image, = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Image can't be blank"
end
end