require_relative '../spec_helper'
require 'pry'
require 'csv'

RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.create(id: 1)

      expect(merchant).to_not be_valid
    end
  end

  describe "Primary Key Creation" do
    it "can be autoincremented" do
      merchant = Merchant.create(name: "Molly")

      expect(merchant.id).to eq(1)
      expect(Merchant.find(1)).to eq(merchant)
    end

    it "can be specified when created" do
      merchant = Merchant.create(id: 123, name: "Molly")

      expect(merchant.id).to eq(123)
      expect(Merchant.find(123)).to eq(merchant)
    end
  end

  describe "Has metric functionality" do
    it "can calculate item_count_per_merchant_id" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 456,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)

      expect(Merchant.item_count_per_merchant_id).to eq({123 => 2, 456 => 1})
    end

    it "returns merchant with most items" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 456,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)

      expect(Merchant.has_most_items.name).to eq("Sally")
    end

    it "can sort merchants by item price" do
      sally = Merchant.create(id: 123, name: "Sally")
      billy = Merchant.create(id: 456, name: "Billy")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 456,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)

      expect(Merchant.sort_by_item_price.last.name).to eq("Billy")
      expect(Merchant.sort_by_item_price.first.name).to eq("Sally")
    end

    it "returns merchant with the highest priced item" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 456,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)

      expect(Merchant.includes_most_expensive_item.name).to eq('Billy')
    end

    it "calculates the total number of items per merchant" do
      sally = Merchant.create(id: 123, name: "Sally")
      billy = Merchant.create(id: 456, name: "Billy")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 456,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)

      expect(sally.total_items).to eq(2)
      expect(billy.total_items).to eq(1)
    end

    it "calculates total price of all merchant items" do
      sally = Merchant.create(id: 123, name: "Sally")
      billy = Merchant.create(id: 456, name: "Billy")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1023,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2099,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 456,
                           category_id: 2)
      item_3 = Item.create(title: "oxford polo",
                           description: "makes you look smart!",
                           price: 1249,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1)

      expect(sally.total_items_price).to eq(22.72)
      expect(billy.total_items_price).to eq(20.99)
    end
  end

  describe "Database Builder" do
    xit "loads csv files" do
      merchants = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)
      merchants.each do |row|
        Merchant.create(id:         row[:id],
                        name:       row[:name],
                        created_at: row[:created_at],
                        updated_at: row[:updated_at])
      end

      expect(Merchant.count).to eq 475
      expect(Merchant.find_by(name: "Princessfrankknits").id).to eq 12334234
    end
  end
end
