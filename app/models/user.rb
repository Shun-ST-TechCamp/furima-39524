class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  validates :last_name_kanji,  presence: true,
                               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters',
                                         if: :last_name_kanji? }
  validates :first_name_kanji, presence: true,
                               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters',
                                         if: :first_name_kanji? }
  validates :last_name_kana,   presence: true,
                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters',
                                         if: :last_name_kana? }
  validates :first_name_kana,  presence: true,
                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters',
                                         if: :first_name_kana? }
  validates :birth_day, presence: true
end
