require 'pry'

describe "user sees merchant dashboard" do
  context "visits merchant dashboard" do
    it "shows merchant with the most items" do
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

      visit '/merchants-dashboard'

      expect(current_path).to eq('/merchants-dashboard')
      expect(page).to have_content('Merchant with most items: Sally')
    end

    it "shows merchant with highest priced item" do
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

      visit '/merchants-dashboard'

      expect(page).to have_content('Merchant with highest priced item: Billy')
    end

    it "shows total items and and total price per merchant" do
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

      visit '/merchants-dashboard'

      expect(page).to have_content("Sally\nNumber of items: 2\nPrice of all items: $22.72")
      expect(page).to have_content("Billy\nNumber of items: 1\nPrice of all items: $20.99")
    end
  end
end
