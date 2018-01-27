require 'pry'

describe "user can edit existing merchant" do
  context "visits merchant edit page" do
    it "edits the name of the merchant" do
      merchant_1 = Merchant.create(id: 123, name: "Sally")
      merchant_2 = Merchant.create(id: 456, name: "Billy")

      visit '/merchants/123/edit'
      fill_in('edit-name', :with => 'Margie')
      click_button('edit-submit')
      edited_merchant = Merchant.find_by(name: 'Margie')

      expect(current_path).to eq('/merchants/123')
      expect(page).to have_content('Margie')
      expect(Merchant.all.count).to eq(2)
      expect(edited_merchant.id).to eq(123)
    end
  end
end
