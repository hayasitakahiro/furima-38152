require 'rails_helper'

RSpec.describe ShippingPurchase, type: :model do
  describe '商品購入' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shipping_purchase = FactoryBot.build(:shipping_purchase, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shipping_purchase).to be_valid
      end
    
    
      it '3桁ハイフン4桁の半角文字列のみ保存可能なこと' do
        @shipping_purchase.postal_code = '123-4567'
         expect(@shipping_purchase).to be_valid
      end
      it '10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @shipping_purchase.phone_number = '09012345679'
        expect(@shipping_purchase).to be_valid
      end
      
    end
      context '内容に問題がある場合' do
      it '郵便番号が空では購入出来ない' do
        @shipping_purchase.postal_code = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include "Postal code can't be blank", 
                                                                   "Postal code is invalid. Include hyphen(-)"
      end
      it '電話番号が空の時は購入出来ない' do
        @shipping_purchase.phone_number = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include "Phone number can't be blank", 
                                                                   "Phone number number is invalid. Include half-width numbers"
      end
      it '都道府県が空の時は購入出来ない' do
        @shipping_purchase.prefecture_id = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空では購入出来ない' do
        @shipping_purchase.city = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では購入出来ない' do
        @shipping_purchase.address = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include "Address can't be blank"
      end
      
    end
    end
  end
