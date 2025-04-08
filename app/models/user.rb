class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :read_first, presence: true
  validates :read_last, presence: true
  validates :email, presence: true, uniqueness: true
  validates :birth_day, presence: true
end
