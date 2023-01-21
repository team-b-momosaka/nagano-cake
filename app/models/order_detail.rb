class OrderDetail < ApplicationRecord

has_many :items, dependent: :destroy
belongs_to :customer

enum production_status: { cannot_be_manufactured: 0, waiting_for_production: 1, in_production: 2, completion_of_production: 3 }

end
