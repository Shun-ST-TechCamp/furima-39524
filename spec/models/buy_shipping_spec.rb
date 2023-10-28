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
      end

      it 'post_codeが3桁ハイフン4桁でないと登録できない' do
      end
      it 'post_codeが半角文字列でないと登録できない' do
      end
      
      it 'municipalityが空だと登録できない' do
      end

      it 'street_adressが空だと登録できない' do
      end

      it 'phoneが空だと登録できない' do
      end

      it 'phoneが数字のみでないと登録できない' do
      end

      it 'phoneが10文字以上、11文字以下でないと登録できない' do
      end

      it 'phoneが半角数値のみでないと保存できない' do
      end

      it 'region_idが空だと登録できない' do
      end

      it 'userが紐づいていないと登録できない' do
      end

      it 'itemが紐づいていないと登録できない' do
      end
    end
  end
end
