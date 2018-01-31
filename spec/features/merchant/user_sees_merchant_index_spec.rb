require 'pry'

describe "user sees merchant index" do
  context "visits merchant index" do
    it "shows the list of merchants" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")

      visit '/merchants'

      expect(current_path).to eq('/merchants')
      within("header") do
        expect(page).to have_content('Merchants')
      end
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
  end

  context "click individual merchant name" do
    it "brings user to individual merchant show page" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")

      visit '/merchants'
      click_link('Sally')

      expect(current_path).to eq("/merchants/#{merchant_1.id}")
    end
  end

  context "click individual merchant edit link" do
    it "brings user to merchant edit page" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")

      visit '/merchants'
      click_link('Edit')

      expect(current_path).to eq("/merchants/#{merchant_1.id}/edit")
    end
  end

  context "click create new merchant link" do
    it "brings user to create new merchant page" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")

      visit '/merchants'
      click_link('Create New Merchant', match: :first)

      expect(current_path).to eq("/merchants/new")
    end
  end
end
