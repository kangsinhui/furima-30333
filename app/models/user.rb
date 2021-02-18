class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみで入力して下さい" } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

  has_many :items

end
