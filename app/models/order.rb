class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def with_tax_price
    (price * 1.1).floor
  end

  enum status: {
     payment_waiting: 0,
     payment_confirmation: 1,
     in_production: 2,
     preparing_delivery: 3,
     delivered: 4
  }

  def subtotal
    cart_item.with_tax_price * amount
  end
  
  def set_date
  created_at.strftime("%Y年%m月%d日%H時%M分")
  end

end
