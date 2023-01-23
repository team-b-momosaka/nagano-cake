class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

      validates :item_id, :merchandise_quantity, presence: true



 def total_price
   no_tax_price * merchandise_quantity * 1.1
   end

end
