class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
          
        
         
         validates :first_name, presence: true, format:  { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # ここがユーザー本名全角の正規表現
         validates :family_name, presence: true, format:  { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # ここがユーザー本名全角の正規表現
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
         validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } # ここがフリガナ全角の正規表現
         validates :birth_date, presence: true
         validates :nickname, presence: true
        

         #has_many :items
         #has_many :purchase_records
end


