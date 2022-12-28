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
