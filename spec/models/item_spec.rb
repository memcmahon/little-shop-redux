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

      require 'pry'; binding.pry
      expect(item.merchant).to be_an_instance_of Merchant
      expect(item.merchant.name).to eq "BowlsByChris"
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
      expect(item.category.name).to eq "Sleepy"
    end
  end
end
