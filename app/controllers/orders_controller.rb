class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      
      @purchase_shipment = PurchaseShipment.new
    if @item.user.id == current_user.id || @item.purchase
      redirect_to root_path
    end
  end

  def create
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      pay_item
      @purchase_shipment.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipment).permit(:post_code, :area_id, :municipalities, :address, :building, :telephone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
