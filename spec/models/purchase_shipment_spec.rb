require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/test_image.jpeg')
    @item.save
    @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: @user.id, item_id: @item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipment).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @purchase_shipment.building = ""
      expect(@purchase_shipment).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @purchase_shipment.token = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it 'prefectureを選択していないと保存できないこと' do
    end
    it 'priceが空だと保存できないこと' do
    end
    it 'priceが全角数字だと保存できないこと' do
    end
    it 'priceが1円未満では保存できないこと' do
    end
    it 'userが紐付いていないと保存できないこと' do
    end
  end
end