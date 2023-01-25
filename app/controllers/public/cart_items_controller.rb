class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    #同アイテム重複なし。
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_quantity = cart_item.merchandise_quantity + @cart_item.merchandise_quantity
          cart_item.update_attribute(:merchandise_quantity,new_quantity)
          @cart_item.delete
        end
      end
      #以上を追記。
    @cart_item.save
    redirect_to cart_items_path


  end



  def index
    @cart_item = current_customer.cart_items.all

      #injectを使った合計金額
    @total_price = @cart_item.inject(0) { |sum,item| sum + item.small_total_price}
  end


  def update

      @cart_item = CartItem.find(params[:id])
      @cart_item.update(cart_item_params)
      redirect_to cart_items_path

  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id,:item_id,:merchandise_quantity)
  end

end
