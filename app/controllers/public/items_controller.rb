class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    #ページネーション用に書き換えた

    @genres = Genre.all
    
  end

  def show
    @item = Item.find(params[:id])
  end
end
