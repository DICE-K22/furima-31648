class BuyingsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_method, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @buying_shipping_address = BuyingShippingAddress.new
  end

  def create
    @buying_shipping_address = BuyingShippingAddress.new(buying_params)
    if @buying_shipping_address.valid?
      pay_item
      @buying_shipping_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buying_params
    params.require(:buying_shipping_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def find_method
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: buying_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if @product.user.id == current_user.id || !@product.buying.nil?
  end
end
