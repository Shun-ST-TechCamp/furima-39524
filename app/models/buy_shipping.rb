class BuyShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :municipality, :street_address, :building_name, :phone 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,        format: {with: /\A\d{3}[-]\d{4}\z/,message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipality
    validates :street_address
    validates :phone,            numericality: { only_integer: true, message:  "is invalid. Input only number"},
                                 format: {with: /\A\d{10,11}\z/,message: "is too short"}
  end

  validates :region_id,        numericality: {other_than: 1, message: "can't be blank"}
  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Shipping.create(post_code: post_code, region_id: region_id, municipality: municipality, street_address: street_address, phone: phone, buy_id: buy.id)
  end
end