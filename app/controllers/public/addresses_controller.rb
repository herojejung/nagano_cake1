class Public::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
  #binding.pry
  if @address.save
    redirect_to public_addresses_path
  end
  end

  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
  if @address.update(address_params)
    redirect_to public_addresses_path
  end
  end

  def destroy
  end

  private
  # ストロングパラメータ
def address_params
  params.require(:address).permit(:id, :customer_id, :name, :postal_code, :address, :genre_id, :is_active)
end
end
