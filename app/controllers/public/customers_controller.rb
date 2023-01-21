class Public::CustomersController < ApplicationController
  def show
    @last_name = current_customer.last_name
    @first_name = current_customer.first_name
    @last_name_kana = current_customer.last_name_kana
    @first_name_kana = current_customer.first_name_kana
    @postal_code = current_customer.postal_code
    @address = current_customer.address
    @telephone_number = current_customer.telephone_number
    @email = current_customer.email

  end

  def edit
  end
end
