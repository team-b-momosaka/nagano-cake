class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image


  #税込み価格表示
  def add_tax_sales_price
    (self.no_tax_price * 1.10).round
  end



end
