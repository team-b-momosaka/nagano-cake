class Admin::WorksController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(order.id) #恐らく修正ポイント？
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
