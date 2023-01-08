class Admin::CustomerController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to admin_customer_path
  end
  end

    private
  # ストロングパラメータ
def customer_params
  params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
end

end
