require 'pry'

describe "user sees item index" do
  context "visits item index" do
    it "shows the list of items" do
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

      visit '/items'

      expect(current_path).to eq('/items')
      within("header") do
        expect(page).to have_content('Items')
      end
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_2.title)
    end
  end

  context "click individual item title" do
    it "brings user to individual item show page" do
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

      visit '/items'
      click_link('socks')

      expect(current_path).to eq("/items/#{item_1.id}")
    end
  end

  context "click individual item edit link" do
    it "brings user to item edit page" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)

      visit '/items'
      click_link('Edit')

      expect(current_path).to eq("/items/#{item_1.id}/edit")
    end
  end

  context "click create new item link" do
    it "brings user to create new item page" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)

      visit '/items'
      click_link('Create New Item', match: :first)

      expect(current_path).to eq("/items/new")
    end
  end
end
