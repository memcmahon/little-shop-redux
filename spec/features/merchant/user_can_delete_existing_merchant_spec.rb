require 'pry'

describe "user can delete existing merchant from index" do
  context "visits merchant index page" do
    xit "deletes an individual merchant" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")

      expect(Merchant.all.count).to eq(2)

      visit '/merchants'
      click_button('delete', match: :first)

      expect(current_path).to eq('/merchants')
      expect(Merchant.all.count).to eq(1)
      expect(Merchant.first.name).to eq('Billy')
    end
  end

  context "visits individual merchant page" do
    xit "deletes the individual merchant" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")

      expect(Merchant.all.count).to eq(2)

      visit "/merchants/#{merchant_1.id}"
      click_button('delete')

      expect(current_path).to eq('/merchants')
      expect(Merchant.all.count).to eq(1)
      expect(Merchant.first.name).to eq('Billy')
    end
  end
end
