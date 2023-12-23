require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @donation_address = FactoryBot.build(:donation_address, user_id: user.id)
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