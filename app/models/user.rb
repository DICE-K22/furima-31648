class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/

  validates :password, format:{with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers'}
  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with: /[^ -~｡-ﾟ]+/, message: 'Full-width characters'}
  validates :given_name, presence: true, format: {with: /[^ -~｡-ﾟ]+/, message: 'Full-width characters'}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters'}
  validates :given_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters'}
  validates :birthday, presence: true
end







