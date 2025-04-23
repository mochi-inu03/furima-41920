class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'must be other than 1' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_burden_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  has_one_attached :image
end
