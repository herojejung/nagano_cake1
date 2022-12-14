class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.bill = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  if @order.update(order_params)
    @order_details.update_all(making_status: 1) if @order.status == "payment_confirmation"
    ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
    redirect_to admin_order_path
  end
  end

private

def order_params
  params.require(:order).permit(:customer_id,:postal_code,:address,:name,:shipping_fee,:bill,:payment_method,:status)
end
end
