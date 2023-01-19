class OrderDetail < ApplicationRecord

has_many :items, dependent: :destroy
belongs_to :customer

end
