class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

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
    
  end

  def edit
    if @item.user_id != current_user.id #&& @item.sold?
      redirect_to root_path, alert: "You are not authorized to edit this item."
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user_id != current_user.id #&& @item.sold?
      @item.destroy
    else
      redirect_to root_path, alert: "You are not authorized to destroy this item."
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image,:title,:description,:category_id,:condition_id,:burden_id,:area_id,:delivery_id,:price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
