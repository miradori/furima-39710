class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string  :post_code, null: false
      t.integer :area_id, null: false
      t.string  :municipalities, null: false
      t.string  :address, null: false
      t.string  :building
      t.string  :telephone_number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
