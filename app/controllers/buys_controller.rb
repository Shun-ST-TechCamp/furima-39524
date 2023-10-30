class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.sold? || @item.user_id == current_user.id
      redirect_to root_path
      return
    end
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @buy_shipping = BuyShipping.new
  end

  def create
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      return redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_shipping).permit(:post_code, :region_id, :municipality, :street_address, :building_name, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
