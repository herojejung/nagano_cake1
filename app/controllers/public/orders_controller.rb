class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
  if @order.save
    redirect_to confirm_path
  end
  end

  def confirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    @order.select_address = params[:order][:select_address]
  if params [:order][:select_address] == "0"
    @order.delivery_address  = current_customer.address
    @order.delivery_name  = current_customer.first_name+current_customer.last_name
    @order.delivery_postal_code  = current_customer.postal_code
  elsif params [:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.delivery_address  = address.address
    @order.delivery_name  = address.first_name+current_customer.last_name
    @order.delivery_postal_code  = address.postal_code
  elsif params [:order][:select_address] == "2"
    @order.delivery_address  = params[:order][:delivery_address]
    @order.delivery_name  = params[:order][:delivery_name]
    @order.delivery_postal_code  = params[:order][:delivery_postal_code]
  else
    render :new
  end
  end

  def complete
  end

  def index
  end

  def show
  end

  private

def order_params
  params.require(:order).permit(:customer_id,:delivery_postal_code,:delivery_address,:delivery_name,:shipping_fee,:bill,:payment_method,:status)
end

end
