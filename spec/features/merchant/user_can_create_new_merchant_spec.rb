require 'pry'

describe "user can create new merchant" do
  context "visits create new merchant" do
    it "adds merchant to merchant index" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")

      visit '/merchants/new'
      fill_in('new-name', :with => 'Margie')
      click_button('new-submit')
      new_merchant = Merchant.find_by(name: 'Margie')

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('Margie')
      expect(Merchant.all.count).to eq(3)
      # expect(new_merchant.id).to eq(1) NEW MERCHANTS AUTO PRIMARY KEY ID!
    end
  end
end
