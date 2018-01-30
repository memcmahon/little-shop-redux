require_relative '../spec_helper'
require 'pry'
require 'csv'

RSpec.describe Category do
  describe "Validations" do
    it "is invalid without a name" do
      category = Category.create

      expect(category).to_not be_valid
    end
  end

  describe "Database Builder" do
    xit "loads csv files" do
      categories = CSV.open("data/categories.csv", headers: true, header_converters: :symbol)
      categories.each do |row|
        Category.create(name: row[:name])
      end
      expect(Category.count).to eq 7
      expect(Category.first.name).to eq "Sleepy"
    end
  end

  describe "Has metric functionality" do
    it "calculates average price of item by category" do
      cheap = Category.create(name: 'expensive')
      expensive = Category.create(name: 'cheap')
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334148,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334146,
                           category_id: 1)

      expect(cheap.average_price).to eq(11.36)
      expect(expensive.average_price).to eq(20.99)
    end

    it "sorts by item price" do
      Category.create(name: 'expensive')
      Category.create(name: 'cheap')
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334148,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334146,
                           category_id: 1)

      expect(Category.sort_by_item_price.first.title).to eq('oxford polo')
      expect(Category.sort_by_item_price.last.title).to eq('ripped jeans')
    end

    it "returns category with most expensive item" do
      Category.create(name: 'cheap')
      Category.create(name: 'expensive')
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334148,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334146,
                           category_id: 1)

      expect(Category.includes_most_expensive_item).to eq('expensive')
    end

    it "returns category with least expensive item" do
      Category.create(name: 'cheap')
      Category.create(name: 'expensive')
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334148,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334146,
                           category_id: 1)

      expect(Category.includes_least_expensive_item).to eq('cheap')
    end
  end
end
