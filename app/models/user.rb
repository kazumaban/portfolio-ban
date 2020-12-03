class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } do
      validates :firstname
      validates :lastname
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :firstname_katakana
      validates :lastname_katakana
    end

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: 'is invalid. Password Include both letters and numbers.'}
  end
end

