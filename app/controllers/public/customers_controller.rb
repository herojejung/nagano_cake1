class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def unsubscribe
  end

  def withdrawal
  end

  private
  # ストロングパラメータ
def customer_params
  params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:adresses,:telephone_number)
end

end
