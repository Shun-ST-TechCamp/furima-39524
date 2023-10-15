class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :until_shipping

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,message: "Price is out of setting range",if: :price?}

  validates :category_id,         numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id,        numericality: { other_than: 1 , message: "can't be blank"} 
  validates :postage_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :region_id,           numericality: { other_than: 1 , message: "can't be blank"} 
  validates :until_shipping_id,   numericality: { other_than: 1 , message: "can't be blank"} 

  
end
