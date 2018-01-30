require 'pry'

describe "user can edit existing item" do
  context "visits item edit page" do
    it "edits the title of the item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)

      visit '/items/1/edit'
      fill_in('edit-title', :with => 'cool socks')
      click_button('edit-submit')
      edited_item = Item.find(1)

      expect(current_path).to eq('/items/1')
      expect(page).to have_content('cool socks')
      expect(edited_item.title).to eq('cool socks')
    end

    it "edits the description of the item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)

      visit '/items/1/edit'
      fill_in('edit-descr', :with => '98% merino wool 2% spandex')
      click_button('edit-submit')
      edited_item = Item.find(1)

      expect(current_path).to eq('/items/1')
      expect(page).to have_content('98% merino wool 2% spandex')
      expect(edited_item.description).to eq('98% merino wool 2% spandex')
    end

    it "edits the price of the item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)

      visit '/items/1/edit'
      fill_in('edit-price', :with => 1950)
      click_button('edit-submit')
      edited_item = Item.find(1)

      expect(current_path).to eq('/items/1')
      expect(page).to have_content('1950')
      expect(edited_item.price).to eq(1950)
    end

    it "edits the image of the item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)

      visit '/items/1/edit'
      fill_in('edit-image', :with => "https://new-image.com")
      click_button('edit-submit')
      edited_item = Item.find(1)

      expect(current_path).to eq('/items/1')
      expect(edited_item.image).to eq("https://new-image.com")
    end

    xit "edits the merchant associated with the item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      old_merchant = Merchant.create(id: 12334145, name: "Bob")
      new_merchant = Merchant.create(id:456, name: "Jasmine")

      visit '/items/1/edit'
      select('Jasmine', :from => 'edit-merchant')
      click_button('edit-submit')
      edited_item = Item.find(1)

      expect(current_path).to eq('/items/1')
      expect(page).to have_content('Jasmine')
      expect(edited_item.merchant.name).to eq("Jasmine")
    end

    it "edits the category associated with the item" do
      item_1 = Item.create(title: "socks",
                           description: "100% merino wool",
                           price: 2299,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 12334145,
                           category_id: 1)
      old_category = Category.create(name: "Sleepy")
      new_category = Category.create(name: "Dopey")

      visit '/items/1/edit'
      select('Dopey', :from => 'edit-category')
      click_button('edit-submit')
      edited_item = Item.find(1)

      expect(current_path).to eq('/items/1')
      expect(edited_item.category.name).to eq("Dopey")
    end
  end
end
