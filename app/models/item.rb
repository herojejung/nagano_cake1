class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  has_many :cart_items

  def with_tax_price
    (price * 1.1).floor
  end

  def show_status
    if is_active
      return "販売中"
    else
      return "販売停止中"
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end