class Item < ActiveRecord::Base
  validates :title,
            :description,
            :price,
            :image,
            :merchant_id,
            :category_id,
            presence: true

end
