class Public::AddresesController < ApplicationController
  def create
    @adress = Address.new(adress_params)
  #binding.pry
  if @adress.save
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
def item_params
  params.require(:adress).permit(:id, :customer_id, :name, :postal_code, :addresses, :genre_id, :is_active)
end
end
