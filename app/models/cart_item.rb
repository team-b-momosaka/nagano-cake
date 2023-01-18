class CartItem < ApplicationRecord
  
  has_many :order_detail, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
end
