require 'pry'

describe "user sees item dashboard" do
  context "visits item dashboard" do
    it "shows the total count of items" do
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

      visit '/items-dashboard'

      expect(current_path).to eq('/items-dashboard')
      expect(page).to have_content("Total Count of Items: 2")
    end

    it "shows the average price of items" do
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1325,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1,
                           created_at: "2016-01-11 09:34:06 UTC")
      item_2 = Item.create(title: "ripped jeans",
                           description: "They'll make you really cool, bro.",
                           price: 2378,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2,
                           created_at: "2014-01-11 09:34:06 UTC")

      visit '/items-dashboard'

      expect(current_path).to eq('/items-dashboard')
      expect(page).to have_content("Average Price of Items: $18.52")
    end

    it "shows the most recently created item" do
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

      visit '/items-dashboard'

      expect(current_path).to eq('/items-dashboard')
      expect(page).to have_content("Most Recently Created Item: soggy socks")
    end

    it "shows the oldest item" do
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

      visit '/items-dashboard'

      expect(current_path).to eq('/items-dashboard')
      expect(page).to have_content("Oldest Item: ripped jeans")
    end
  end
end
