class Address < ApplicationRecord
  belongs_to :customer

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
end
