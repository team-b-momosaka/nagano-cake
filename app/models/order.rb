class Order < ApplicationRecord

has_many :order_details, dependent: :destroy
belongs_to :customer

enum payment_method: { credit_card: 0, transfer: 1 }
enum order_status: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }
end
