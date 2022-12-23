class Public::CartItemsController < ApplicationController
def create
  @item = Item.find(cart_item_params[:item_id])
  @cart_item = CartItem.new(params[:id])
if @cart_item.save
  redirect_to cart_items_path
else
  render:new
end

def index
  @cart_items = current_customer.cart_items
  @total = 0
end

private

def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount,:customer_id)
end
end
end