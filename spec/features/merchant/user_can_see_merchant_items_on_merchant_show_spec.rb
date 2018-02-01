describe "user can view items by merchant" do
  context "visits merchant show page" do
    it "includes merchant's items" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      item_1 = Item.create(title: "soggy socks",
                           description: "yikes my feet are wet!",
                           price: 1000,
                           image: "https://upload.wikimedia.org/wikipedia/commons/a/ab/SnowWhite44.jpg",
                           merchant_id: 123,
                           category_id: 1,
                           created_at: "2016-01-11 09:34:06 UTC")

      visit '/merchants/123'

      expect(page).to have_content('Sally')
      expect(page).to have_content('soggy socks')
    end
  end
end
