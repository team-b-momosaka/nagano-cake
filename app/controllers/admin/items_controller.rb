class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def show
  end

  def edit
  end
end
