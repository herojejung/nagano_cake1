class Public::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.customer_id  = current_customer.id
  if @address.save
    redirect_to public_addresses_path
  end
  end

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id  = current_customer.id
  if @address.update(address_params)
    redirect_to public_addresses_path
  end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.customer_id  = current_customer.id
  if @address.destroy
    redirect_to public_addresses_path
  end
  end

  private
  # ストロングパラメータ
def address_params
  params.require(:address).permit(:name, :postal_code, :address)
end
end
