class Category < ActiveRecord::Base
  validates :name, presence: true

  validates :id, uniqueness: true

  has_many :items

  def average_price
    items.average_price
  end

  def self.sort_by_item_price
    select("categories.*, items.*").joins(:items)
      .order('price')
  end

  def self.includes_most_expensive_item
    sort_by_item_price.last.name
  end

  def self.includes_least_expensive_item
    sort_by_item_price.first.name
  end
end
