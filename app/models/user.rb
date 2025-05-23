class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validate :password_is_half_width

  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :read_first, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
    validates :read_last, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' }
    validates :birth_day
  end

  private

  def password_is_half_width
    return unless password =~ /[^\x00-\x7F]/

    errors.add(:password, 'には半角文字を使用してください')
  end

  has_many :items
  has_many :orders
end
