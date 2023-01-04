class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
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
    @order.customer_id = current_customer.id
    
  if params[:order][:select_address] == "0"
    @order.address  = current_customer.address
    @order.name  = current_customer.first_name+current_customer.last_name
    @order.postal_code  = current_customer.postal_code
  elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.address  = @address.address
    @order.name  = @address.first_name+current_customer.last_name
    @order.postal_code  = @address.postal_code
  elsif params[:order][:select_address] == "2"
    @order.address  = params[:order][:address]
    @order.name  = params[:order][:name]
    @order.postal_code  = params[:order][:postal_code]
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
  params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_fee,:bill,:payment_method,:status)
end

end
