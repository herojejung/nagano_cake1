class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
  if @customer.update(customer_params)
    redirect_to public_customers_path
  end
  end

  def unsubscribe
  end

  def withdrawal
    @customer = (current_customer)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
  # ストロングパラメータ
def customer_params
  params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:adresses,:telephone_number)
end

end
