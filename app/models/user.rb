class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :purchased_records

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :nickname, presence: true
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :last_name, presence: true, format: { with: ZENKAKU_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true, format: { with: ZENKAKU_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name_kana, presence: true, format: { with: KATAKANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :birth_date, presence: true
end
