require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、
      family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '890iop'
        @user.password_confirmation = '890iop'
        expect(@user).to be_valid
      end
    end
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
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it "family_nameがない場合は登録できないこと" do
      @user.family_name = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Family_name can't be blank"
    end
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
       expect(@user.errors.full_messages).to include ("First_name_kana can't be blank")
    end
    it "family_name_kanaがない場合は登録できないこと" do
      @user.family_name_kana = ''
      @user.valid?
       expect(@user.errors.full_messages).to include ("Family_name_kana can't be blank")
    end
    it "birth_dateがない場合は登録できないこと" do
      @user.birth_date = ''
      @user.valid?
       expect(@user.errors.full_messages).to include "Birth_date can't be blank"
    end
    it 'passwordが6文字以下であれば登録できない' do
      @user.password = '890io'
      @user.password_confirmation = '890io'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '890iop'
      @user.password_confirmation = '123qw'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
      @user.password = 'asdzxc'
      @user.password_confirmation = 'asdzxc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
    end

    it 'passwordが半角英数字混合でなければ登録できない(数字のみ)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
    end

    it 'passwordが半角でなければ登録できない' do
      @user.password = 'ＡＢｃ１２３'
      @user.password_confirmation = 'ＡＢｃ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
    end

    it 'family_nameが全角文字でなければ登録できない' do
      @user.first_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family_nameには全角文字を使用してください')
    end

    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First_nameには全角文字を使用してください')
    end

    it 'family_name_kanaが全角カタカナでなければ登録できない' do
      @user.family_name_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('family_name_kanaには全角カタカナを使用してください')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First_name_kana には全角カタカナを使用してください')
    end
   end
end
