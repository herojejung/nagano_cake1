class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
  @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  @cart_item.amount += params[:cart_item][:amount].to_i
  @cart_item.save
  redirect_to cart_items_path
elsif @cart_item.save
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
  cart_item = CartItem.find(params[:id])
  @cart_items = current_customer.cart_items
if cart_item.update(cart_item_params)
  redirect_to cart_items_path
end
end

def destroy
  cart_item = CartItem.find(params[:id])
  @cart_items = current_customer.cart_items
if cart_item.destroy
  redirect_to cart_items_path
end
end

def destroy_all
  CartItem.destroy_all
  redirect_to cart_items_path
end

private

def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount, :customer_id)
end
end