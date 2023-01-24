class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def new
    @items = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    if redirect_to admin_item_path(item)
    else
      render :new
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_text, :no_tax_price, :sale_status, :genre_id, :image)
  end
end
