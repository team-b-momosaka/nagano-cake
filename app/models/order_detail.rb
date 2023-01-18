class OrderDetail < ApplicationRecord
  
has_many :item, dependent: :destroy
belongs_to :customer
  
end
