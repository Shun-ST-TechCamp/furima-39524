require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buy_shipping).to be_valid
      end

      it 'building_nameは空でも登録できる' do
        @buy_shipping.building_name = ''
        expect(@buy_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと登録できない' do
        @buy_shipping.post_code = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが3桁ハイフン4桁でないと登録できない' do
        @buy_shipping.post_code ='123456'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'post_codeが半角文字列でないと登録できない' do
        @buy_shipping.post_code = "１２３-４５６"
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      
      it 'municipalityが空だと登録できない' do
        @buy_shipping.municipality = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'street_adressが空だと登録できない' do
        @buy_shipping.street_address = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phoneが空だと登録できない' do
        @buy_shipping.phone = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが数字のみでないと登録できない' do
        @buy_shipping.phone = '0801111-111'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone is invalid. Input only number")
      end

      it 'phoneが9文字以下だと登録できない' do
        @buy_shipping.phone = '123456789'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone is too short")
      end

      it 'phoneが12文字以上だと登録できない' do
        @buy_shipping.phone = '123456789012'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone is too short")
      end

      it 'phoneが半角数値のみでないと保存できない' do
        @buy_shipping.phone = "０８０１１１１１１１１"
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Phone is invalid. Input only number")
      end

      it 'region_idが1だと登録できない' do
        @buy_shipping.region_id = '1'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Region can't be blank")
      end

      it 'userが紐づいていないと登録できない' do
        @buy_shipping.user_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと登録できない' do
        @buy_shipping.item_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end

        it 'tokenが空だと登録できない' do
          @buy_shipping.token = nil
          @buy_shipping.valid?
          expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
