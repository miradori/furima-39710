class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order("created_at DESC").all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  # def update
  #   @item = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:image,:title,:description,:category_id,:condition_id,:burden_id,:area_id,:delivery_id,:price).merge(user_id: current_user.id)
  end
end
