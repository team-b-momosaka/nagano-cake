class Item < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
  
  validates :item_name, presence: true
  validates :item_text, presence: true
  validates :no_tax_price, presence: true
  validates :genre, presence: true


  def get_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
        image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      image.variant(resize_to_limit: [width, height]).processed
  end




        #消費税込み
    def on_tax_price
      tax_rate = 1.1
      (self.no_tax_price * tax_rate).floor
    end



end
