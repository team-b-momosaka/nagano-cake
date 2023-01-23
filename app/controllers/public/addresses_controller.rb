class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end
