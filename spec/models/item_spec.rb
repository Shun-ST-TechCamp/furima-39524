require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品が登録できる場合' do
      it 'name,description,category_id,condition_id,postage_id,region_id,until_shipping_id,price,user,imageが存在していれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @item.name =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'region_idが空では登録できない' do
        @item.region_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'until_shipping_idが空では登録できない' do
        @item.until_shipping_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Until shipping can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが大文字では登録できない' do
        @item.price ='５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'priceに文字が入っていると登録できない' do
        @item.price ='5a00'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
        it 'priceが300未満では登録できない'do
        @item.price ='100'
        @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
        it 'priceが10000000以上だと登録できない' do
        @item.price ='10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'category_idが1では登録できない' do
        @item.category_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_idが1では登録できない' do
        @item.postage_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'region_idが1だと登録できない' do
        @item.region_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'until_shipping_idが1だと登録できない' do
        @item.until_shipping_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Until shipping can't be blank")
      end
    end
  end
end
