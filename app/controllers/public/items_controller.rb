class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    #ページネーション用に書き換えた。8個まで表示する。
    @item = Item.all

    @genres = Genre.all

  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end


end
