require 'pry'

describe "user sees category dashboard" do
  context "visits category dashboard" do
    it "shows the average item price per category" do
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

      visit '/categories-dashboard'

      expect(current_path).to eq('/categories-dashboard')
      expect(page).to have_content("cheap: $11.36")
      expect(page).to have_content("expensive: $20.99")
    end

    it "shows the category with the most expensive item" do
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

      visit '/categories-dashboard'

      expect(page).to have_content("Category with most expensive item: expensive")
    end

    it "shows the category with the least expensive item" do
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

      visit '/categories-dashboard'

      expect(page).to have_content("Category with least expensive item: cheap")
    end
  end
end
