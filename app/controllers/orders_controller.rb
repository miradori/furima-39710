class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    #@item = Item.find(params[:id])
  end

  def new
    @purchase_shipment = PurchaseShipment.new
  end

  def create
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      @purchase_shipment.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:donation_address).permit(:post_code, :area, :municipalities, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end


end
