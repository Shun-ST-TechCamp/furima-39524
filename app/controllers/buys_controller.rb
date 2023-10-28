class BuysController < ApplicationController

  def index
    @buy_shipping = BuyShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
  end

end
