class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order.bill = 0


  if params[:order][:select_address] == "0"
    @order.address  = current_customer.address
    @order.name  = current_customer.first_name+current_customer.last_name
    @order.postal_code  = current_customer.postal_code
  elsif params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.address  = @address.address
    @order.postal_code  = @address.postal_code
    @order.name  = @address.name
  elsif params[:order][:select_address] == "2"
    @order.address  = params[:order][:address]
    @order.name  = params[:order][:name]
    @order.postal_code  = params[:order][:postal_code]
  else
    render :new
  end
  end

  def create
    @order = Order.new(order_params)
    @order.status = 0
    @order.save
current_customer.cart_items.each do |cart_item|
  @order_details = OrderDetails.new
  @order_details.order_id =  @order.id
  @order_details.item_id = cart_item.item_id
  @order_details.amount = cart_item.amount
  @order_details.amount_billed = cart_item.item.with_tax_price
  @order_details.making_status = 0
  @order_details.save
  end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
  end

  private

def order_params
  params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_fee,:bill,:payment_method,:status)
end
end
