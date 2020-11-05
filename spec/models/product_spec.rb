require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '新規出品' do
    context '出品がうまく行くとき' do
      it 'image, name, description, category_id, condition_id, burden_id, shipping_area_id, shipping_day_id, priceが存在すれば出品できる' do
        expect(@product).to be_valid
      end
      it 'priceが¥300~¥9,999,999の間であれば出品できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
      it 'price入力が半角数字であれば出品できる' do
        @product.price = 434
        expect(@product).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end
      it 'category_idのidが1だった場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが空では出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition Select')
      end
      it 'condition_idのidが1だった場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end
      it 'burden_idが空では出品できない' do
        @product.burden_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Burden Select')
      end
      it 'burden_idのidが1だった場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end
      it 'shipping_area_idが空では出品できない' do
        @product.shipping_area_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping area Select')
      end
      it 'shipping_area_idのidが1だった場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end
      it 'shipping_day_idが空では出品できない' do
        @product.shipping_day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping day Select')
      end
      it 'shipping_day_idのidが1だった場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category Select')
      end
      it 'priceが空では出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300円以下であれば出品できない' do
        @product.price = 12
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが¥9,999,999以上であれば出品できない' do
        @product.price = 11_111_111_111_111_111_111_111
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end
      it 'price入力が半角数字以外であれば出品できない' do
        @product.price = '９００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
