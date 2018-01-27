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
  end

  describe "Validations" do
    it "is invalid without a description" do
      item = Item.create(title: "soggy socks",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 7)

      expect(item).to_not be_valid
    end
  end

  describe "Validations" do
    it "is invalid without a price" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145,
                         category_id: 7)

      expect(item).to_not be_valid
    end
  end

  describe "Validations" do
    it "is invalid without an image" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         merchant_id: 12334145,
                         category_id: 7)

      expect(item).to_not be_valid
    end
  end

  describe "Validations" do
    it "is invalid without a merchant_id" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         category_id: 7)

      expect(item).to_not be_valid
    end
  end

  describe "Validations" do
    it "is invalid without a merchant_id" do
      item = Item.create(title: "soggy socks",
                         description: "yikes my feet are wet!",
                         price: 1099,
                         image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                         merchant_id: 12334145)

      expect(item).to_not be_valid
    end
  end
end
