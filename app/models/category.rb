class Category < ActiveRecord::Base
  validates :name, presence: true

  validates :id, uniqueness: true

  has_many :items

  def average_price
    items.average_price
  end

  def self.with_item_attributes
    select("categories.*, items.*").joins(:items)
  end
end
