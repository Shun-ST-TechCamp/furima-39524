class BuysController < ApplicationController

  def index
    @buy_shipping = BuyShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      @buy_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_shipping).permit(:post_code, :region_id, :municipality, :street_address, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
