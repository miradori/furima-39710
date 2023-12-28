require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
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
    it 'post_codeが空だと保存できないこと' do
      @purchase_shipment.post_code = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipment.post_code = "1234567"
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'area_idが---では登録できない' do
      @purchase_shipment.area_id = 0
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalitiesが空だと保存できないこと' do
      @purchase_shipment.municipalities = ''
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @purchase_shipment.address = ''
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Address can't be blank")
    end
    it 'telephone_numberが空だと保存できないこと' do
      @purchase_shipment.telephone_number = ''
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが9桁以下の場合保存できないこと' do
      @purchase_shipment.telephone_number = '123456789'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
    end
    it 'telephone_numberが12桁以上の場合保存できないこと' do
      @purchase_shipment.telephone_number = '012345678912'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
    end
    it 'telephone_numberが数字でないと保存できないこと' do
      @purchase_shipment.telephone_number = 'abcdefghijk'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Telephone number is not a number")
    end
    it 'userが紐付いていないと保存できないこと' do
      @purchase_shipment.user_id = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @purchase_shipment.item_id = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Item can't be blank")
    end
  end
end