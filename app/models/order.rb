class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def with_tax_price
    (price * 1.1).floor
  end


  def subtotal
    cart_item.with_tax_price * amount
  end


end
