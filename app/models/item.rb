class Item < ActiveRecord::Base
  validates :title,
            :description,
            :price,
            :image,
            :merchant_id,
            :category_id,
            presence: true

  validates :id, uniqueness: true

  belongs_to :merchant
  belongs_to :category

  def self.average_price
    (average(:price) / 100).to_f.round(2)
  end
end
