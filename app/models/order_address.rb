class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code, :prefecture_id, :city, :address_line, :building_name, :phone_number,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be other than 1' }
    validates :city
    validates :address_line
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ::Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address_line: address_line,
                     building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
