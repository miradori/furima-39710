class ItemsController < ApplicationController

  def index
    @items = Item.all#order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create

  end


  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
