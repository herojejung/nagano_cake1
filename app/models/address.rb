class Address < ApplicationRecord
  belongs_to :customer
  
  validates :address,  presence: true, length: { in: 1..48 }
  validates :name, presence: true, length: { in: 1..32 }
  validates :postal_code,  presence: true
  
def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
end

end
