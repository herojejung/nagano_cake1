class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
def new
end

def top
  @order = Order.where(customer_id: @params).where(order_id: @params).where(created_at: :desc)
  @orders = Order.all
  @amount = 0
end

end