require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '内容に問題ないとき' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
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

    it 'post_codeにハイフンが含まれていると保存できない' do
      @order_address.post_code = '1230000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
  end
end
