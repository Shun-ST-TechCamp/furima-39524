class BuysController < ApplicationController

  def index
    @buy_shipping = BuyShipping.new
  end

end
