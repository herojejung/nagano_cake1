class Public::CartItemsController < ApplicationController
def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
if @cart_item.save
  redirect_to cart_items_path
else
  render:new
end
end

def index
  @cart_items = current_customer.cart_items
  @total = 0
end

def update
  @cart_item = current_customer.cart_item
if @cart_item.update(cart_item_params)
  redirect_to new_order_path
end
end

private

def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount,:customer_id)
end
end