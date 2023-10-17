class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      Rails.logger.debug(@item.errors.full_messages)
      render :new, status: :unprocessable_entity
    end
  end

private

    def item_params
      params.require(:item).permit(:name,:image,:description,:price,:category_id,:condition_id,:postage_id,:region_id,:until_shipping_id).merge(user_id: current_user.id)
    end
end
