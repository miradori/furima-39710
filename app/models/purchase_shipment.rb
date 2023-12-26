class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :area_id, :municipalities, :address, :building, :telephone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :telephone_number
  end
  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipment.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end