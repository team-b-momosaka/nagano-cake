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
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
   def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true) #falseからtrueに制約を変える
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  
  def destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
  end

end
