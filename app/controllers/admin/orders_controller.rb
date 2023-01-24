class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      if order.order_status == "payment_confirmation"
        order.order_details.each do |order_detail|
          order_detail.update(production_status: 1)
        end
      end
      redirect_to admin_order_path(order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end

  # binding.pry