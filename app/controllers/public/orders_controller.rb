class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
current_customer.cart_items.each do |cart_item| 
  @order_item = OrderItem.new 
  @order_item.item_id = cart_item.item_id #商品idを注文商品idに代入
  @order_item.number_of_items = cart_item.number_of_items #商品の個数を注文商品の個数に代入
  @order_item.items_tax_included_price = (cart_item.item.unit_price_without_tax*1.1).floor #消費税込みに計算して代入
  @order_item.order_id =  @order.id #注文商品に注文idを紐付け
  @order_item.save #注文商品を保存
end #ループ終わり

  def confirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @total = 0
    @bill = 0


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
