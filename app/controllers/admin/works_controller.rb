class Admin::WorksController < ApplicationController
  def update
    order = Order.find(params[:id])
    order_detail = OrderDetail.find_by(order_id: order.id)
    if order_detail.update(order_detail_params)
     redirect_to admin_order_path(order.id) #恐らく修正ポイント？
    else
     render "index"
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
