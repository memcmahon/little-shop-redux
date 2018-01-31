require 'pry'

describe "user can delete existing item from index" do
  context "visits item index page" do
    it "deletes an individual item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "shoes",
                           description: "hiking shoes",
                           price:11056,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2)

      expect(Item.all.count).to eq(2)

      visit '/items'
      click_button('delete', match: :first)

      expect(current_path).to eq('/items')
      expect(Item.all.count).to eq(1)
      expect(Item.first.title).to eq('shoes')
    end
  end

  context "visits individual item page" do
    it "deletes the individual item" do
      merchant = Merchant.create(id: 12334145, name: "Billy")
      category = Category.create(id: 1, name: "category")
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      item_2 = Item.create(title: "shoes",
                           description: "hiking shoes",
                           price:11056,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 2)

      expect(Item.all.count).to eq(2)

      visit "/items/#{item_1.id}"
      click_button('delete')

      expect(current_path).to eq('/items')
      expect(Item.all.count).to eq(1)
      expect(Item.first.title).to eq('shoes')
    end
  end
end
