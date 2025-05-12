class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_item_owner
  before_action :redirect_if_sold_out

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  params.require(:order_address)
        .permit(
          :post_code, :prefecture_id, :city, :address_line,
          :building_name, :phone_number, :price
        ).merge(
          user_id: current_user.id,
          item_id: params[:item_id]
        )

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_item_owner
    redirect_to root_path if current_user.id == @item.user_id
  end

  def redirect_if_sold_out
    redirect_to root_path if @item.order.present?
  end
end
