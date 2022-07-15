require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Last_name can't be blank"
    end
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "First_name_kana can't be blank"
    end
    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Last_name_kana can't be blank"
    end
    it "birth_dateがない場合は登録できないこと" do
      @user.birth_date = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Birth_date can't be blank"
    end
   end
end
