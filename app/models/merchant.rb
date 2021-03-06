class Merchant < ActiveRecord::Base
  validates :name, presence: true

  validates :id, uniqueness: true

  has_many :items

  def self.has_most_items
    select("merchants.*, count(items) AS item_count")
      .joins(:items)
      .group(:id)
      .order("item_count")
      .last
  end

  def self.sort_by_item_price
    select("merchants.*, items.*")
      .joins(:items)
      .order("price")
  end

  def self.includes_most_expensive_item
    sort_by_item_price.last
  end

  def total_items
    items.count
  end

  def total_items_price
    (items.reduce(0) do |sum, item|
      sum + item.price
    end / 100.0).round(2)
  end
end
