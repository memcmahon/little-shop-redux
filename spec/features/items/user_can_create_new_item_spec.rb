require 'pry'

describe "user can create new item" do
  context "visits create new item" do
    xit "adds item to item index" do
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
      merchant = Merchant.create(name: "Jose")
      category = Category.create(name: 'Dopey')

      visit '/items/new'
      fill_in('new-title', :with => 'hat')
      fill_in('new-descr', :with => 'lovely hat made from organic mushrooms')
      fill_in('new-price', :with => 3800)
      fill_in('new-image', :with => 'http://new-image.com')
      select('Jose', :from => 'new-merchant')
      select('Dopey', :from => 'new-category')
      click_button('new-submit')
      new_item = Item.find_by(title: 'hat')

      binding.pry
      expect(current_path).to eq('/items')
      expect(Item.all.count).to eq(3) # <---- actual 2
      expect(page).to have_content('hat')
      expect(item.id).to eq(3)
      expect(item.merchant.name).to eq('Jose')
      expect(item.category.name).to eq('Dopey')
    end
  end
end
