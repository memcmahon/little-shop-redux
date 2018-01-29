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
    # require 'pry'; binding.pry
    (average(:price) / 100).to_f.round(2)
  end

  def self.most_recent
    order(:created_at).last
  end

  def self.oldest
    order(:created_at).first
  end
end
