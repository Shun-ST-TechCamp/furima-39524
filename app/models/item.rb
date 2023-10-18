class Item < ApplicationRecord
  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true,
                                  inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                                  numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :image,               presence: true

  def was_attached?
    image.attached?
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :until_shipping

  validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :until_shipping_id,   numericality: { other_than: 1, message: "can't be blank" }
end
