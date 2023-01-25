class Admin::WorksController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    if order_detail.update(order_detail_params)
      if order_detail.production_status == "in_production"
        order.update(order_status: 2)
      elsif order.order_details.count == order.order_details.where(production_status: "completion_of_production").count
        order.update(order_status: 3)
      end
      redirect_to admin_order_path(order_detail.order.id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end

    # binding.pry