class Public::CartItemsController < ApplicationController
def create
  @cart_item = CartItem.new(cart_item_params)
if @cart_item.save
  redirect_to cart_items_path
end
end

def index
end


def cart_item_params
    params.require(:cart_item).permit(:item_id,:customer_id,:amount)
end
end