require 'rails_helper'

RSpec.describe BuyingShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @buying_shipping_address = FactoryBot.build(:buying_shipping_address)
    end
    context '商品購入がうまくいくとき' do
      it '全ての値が正しく入力できていれば購入できる' do
        expect(@buying_shipping_address).to be_valid
      end
      it 'postal_codeにハイフンが含まれていれば購入できる' do
        @buying_shipping_address.postal_code = '444-4444'
        expect(@buying_shipping_address).to be_valid
      end
      it 'phone_numberが11桁以内であれば購入できる' do
        @buying_shipping_address.phone_number = '00000000000'
        expect(@buying_shipping_address).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @buying_shipping_address.token = nil
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @buying_shipping_address.postal_code = nil
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれていなけれな購入できない' do
        @buying_shipping_address.postal_code = '4444444'
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県が空であれば購入できない' do
        @buying_shipping_address.prefecture_id = nil
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Select")
      end
      it '都道府県を選択していなければ購入できない' do
        @buying_shipping_address.prefecture_id = '1'
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Prefecture Select")
      end
      it '市町村区が空であれば購入できない' do
        @buying_shipping_address.city = nil
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空であれば購入できない' do
        @buying_shipping_address.house_number = nil
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空であれば購入できない' do
        @buying_shipping_address.phone_number = nil
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁以上であれば購入できない' do
        @buying_shipping_address.phone_number = '00000000000000'
        @buying_shipping_address.valid?
        expect(@buying_shipping_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
