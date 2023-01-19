class Admin::HomesController < ApplicationController
  def top
    @oreders = Order.all
  end
end
