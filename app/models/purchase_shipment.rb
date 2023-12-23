class PurchaseShipment
  include ActiveModel::Model
  attr_accessor :post_code, :area, :municipalities, :address, :building, :telephone_number, :user_id, :item_id

  with_options presence: true do
    #validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :area, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipment.create(post_code: post_code, area: area, municipalities: municipalities, address: address, building: building, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end