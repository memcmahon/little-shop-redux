require_relative '../spec_helper'
require 'pry'
require 'csv'

RSpec.describe Item do
  describe "Validations" do
    it "is invalid without a title" do
      item = Item.create(description: "soggy socks",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 7)
      expect(item).to_not be_valid
    end

    it "is invalid without a description" do
      item = Item.create(title: "soggy socks",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 7)

      expect(item).to_not be_valid
    end


    it "is invalid without a price" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 7)

      expect(item).to_not be_valid
    end

    it "is invalid without an image" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         merchant_id: 12334145,
                         category_id: 7)

      expect(item).to_not be_valid
    end

    it "is invalid without a merchant_id" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         category_id: 7)

      expect(item).to_not be_valid
    end

    it "is invalid without a category_id" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145)

      expect(item).to_not be_valid
    end
  end

  describe "has correct links" do
    it "is linked to a merchant object" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 7)
      merchant = Merchant.create(id: 12334145, name: "BowlsByChris")

      expect(item.merchant).to be_an_instance_of Merchant
      expect(item.merchant.name).to eq("BowlsByChris")
    end

    it "is linked to a category object" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 1)
      category = Category.create(name: "Sleepy")

      expect(item.category).to be_an_instance_of Category
      expect(item.category.name).to eq("Sleepy")
    end
  end

  describe "has metric functionality" do
    it "translates price price of items to float" do
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1130,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 531,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2)

      expect(item_1.price_to_dollars).to eq(11.3)
      expect(item_2.price_to_dollars).to eq(5.31)
    end

    it "calculates average price of items" do
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2)

      expect(Item.average_price).to eq(15.00)
    end

    it "can return most recently created item" do
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1,
                           created_at: "2016-01-11 09:34:06 UTC")
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2,
                           created_at: "2014-01-11 09:34:06 UTC")

      expect(Item.most_recent).to eq(item_1)
    end

    it "can return oldest item" do
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1,
                           created_at: "2014-01-11 09:34:06 UTC")
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2,
                           created_at: "2016-01-11 09:34:06 UTC")

      expect(Item.oldest).to eq(item_1)
    end
  end

  describe "Database Builder" do
    it "loads csv files" do
      items = CSV.open("spec/fixtures/items_fixture.csv", headers: true, header_converters: :symbol)
      items.each do |row|
        Item.create(id:           row[:id],
                    title:        row[:name],
                    description:  row[:description],
                    price:        row[:unit_price].to_i,
                    image:        "http://www.yourwdwstore.net/thumbnail.asp?file=assets/images/4/40000/4000/600/44649.jpg&maxx=300&maxy=0",
                    merchant_id:  row[:merchant_id],
                    created_at:   row[:created_at],
                    updated_at:   row[:updated_at],
                    category_id:  rand(1..7))
      end

      expect(Item.count).to eq(16)
      expect(Item.find_by(title: "Course contre la montre").id).to eq(263396517)
    end
  end
end
