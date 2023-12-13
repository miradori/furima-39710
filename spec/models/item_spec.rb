require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品の出品機能' do
    context '出品ができる時' do
      # before do
      #   @item = FactoryBot.build(:item)
      #   # @item.image = fixture_file_upload('app/assets/images/item_sample.png')
      # end

      it 'image,title,description,category_id,condition_id,burden_id,area_id,delivery_id,price,user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      # before do
      #   @item = FactoryBot.build(:item)
      #   # @item.image = fixture_file_upload('app/assets/images/item_sample.png')
      # end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it 'titleが40文字以内でなければ登録できない' do
        @item.title = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "Title is too long (maximum is 40 characters)"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'descriptionが1000文字以内でなければ登録できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Description is too long (maximum is 1000 characters)"
      end
      it 'category_idが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'burden_idが---では登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it 'area_idが---では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'delivery_idが---では登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300から¥9,999,999の範囲内で、半角数値のみが有効です")
      end
      it 'priceが9,999,999より多ければ登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300から¥9,999,999の範囲内で、半角数値のみが有効です")
      end
      it 'priceが半角数字以外が含まれていると出品できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300から¥9,999,999の範囲内で、半角数値のみが有効です")
      end
      it 'userが空では登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
