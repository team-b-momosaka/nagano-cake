class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
      @order.shipping_postcode = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postcode = @address.postcode
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name

    elsif params[:order][:select_address] == "2"
      @order.shipping_postcode = params[:order][:shipping_postcode]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    end

    #binding.pry ←デバック用

    @cart_items = current_customer.cart_items.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      current_customer.cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.purchase_price = cart_item.item.on_tax_price
        order_detail.quantity = cart_item.merchandise_quantity
        order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    end
  end

  def complete
  end


  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_postcode, :shipping_address, :shipping_name, :customer_id, :postage, :billing_amount)
  end

end
