require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '内容に問題ないとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空の場合も保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
  end

  context '内容に問題があるとき' do
    it 'post_codeが空だと保存できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'prefecture_idが1では保存できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'cityが空だと保存できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'address_lineが空だと保存できない' do
      @order_address.address_line = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address line can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'post_codeが全角数字では保存できない' do
      @order_address.post_code = '０９０００００００００'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it 'post_codeにハイフンが含まれていないと保存できない' do
      @order_address.post_code = '1230000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it 'phone_numberが9桁では保存できない' do
      @order_address.phone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number within 10 to 11 digits')
    end

    it 'phone_numberが12桁では保存できない' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number within 10 to 11 digits')
    end

    it 'phone_numberに半角数値以外が含まれていると保存できない' do
      @order_address.phone_number = '09012345#saA'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number within 10 to 11 digits')
    end

    it 'tokenが空では保存できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
