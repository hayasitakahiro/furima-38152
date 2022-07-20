require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end
describe '商品出品' do
  context '全ての項目が入力されていれば出品できる' do
    it 'category、product_condition、prefecture、burden_of_shipping_charge、shipping_day、product_name、
    price、image、description_of_item、が入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できない時' do
it 'category_idに「---」が選択されている場合は出品できない' do
  @item.category_id = '1'
  @item.valid?
   expect(@item.errors.full_messages).to include "Category must be other than 1"
end
it 'product_condition_idに「---」が選択されている場合は出品できない' do
  @item.product_condition_id = '1'
  @item.valid?
   expect(@item.errors.full_messages).to include "Product condition must be other than 1"
end
it 'prefecture_idに「---」が選択されている場合は出品できない' do
  @item.prefecture_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
end
it 'burden_of_shipping_charge_idに「---」が選択されている場合は出品できない' do
  @item.burden_of_shipping_charge_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include "Burden of shipping charge must be other than 1"
end
it 'shipping_day_idに「---」が選択されている場合は出品できない' do
  @item.shipping_day_id = '1'
  @item.valid?
   expect(@item.errors.full_messages).to include "Shipping day must be other than 1"
end
it 'priceが空では出品できない' do
  @item.price = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Price is not a number"
end
it 'priceに半角数字以外が含まれている場合は出品できない' do
  @item.price = '999a'
  @item.valid?
   expect(@item.errors.full_messages).to include "Price is not a number"
end
it 'priceが300円未満では出品できない' do
  @item.price = '299'
  @item.valid?
   expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
end
it 'priceが9999999円を超えると出品できない' do
  @item.price = '10000000'
  @item.valid?
  binding.pry
   expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
end

it 'product_nameが空では出品できない' do
  @item.product_name = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Product name can't be blank"
end


it 'imageがない場合は出品できないこと' do
  @item.image = nil
  @item.valid?
   expect(@item.errors.full_messages).to include "Image can't be blank"
end

it 'userが紐付いていなければ出品できない' do
  @item.user = nil
  @item.valid?
   expect(@item.errors.full_messages).to include "User must exist"
end
it 'description_of_itemが空では出品できない' do
  @item.description_of_item = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Description of item can't be blank"
end
end
end
end
