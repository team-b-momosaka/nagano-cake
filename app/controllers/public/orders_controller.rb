class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if params[:order][:select_address] == "0"
      @order.shipping_postcode = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postcode = @address.postcode
      @order.shipping_address = @address.addresses
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
    redirect_to orders_complete_path
  end

  def complete
  end


  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_postcode, :shipping_address, :shipping_name)
  end

end
