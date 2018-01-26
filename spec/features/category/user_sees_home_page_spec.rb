require 'pry'

describe "user sees home page" do
  context "visit root page" do
    it "shows the dashboard" do
      visit '/'
      expect(current_path).to eq('/')
      within("header") do
        expect(page).to have_content('Welcome')
      end
    end
  end

  context "user can navigate from root to indexes" do
    it "has links for indexes" do
      visit '/'
      expect(current_path).to eq('/')
      within("nav") do
        click_link 'Merchant Index'
          expect(current_path).to eq('/merchants')
        click_link 'Category Index'
          expect(current_path).to eq('/categories')
        click_link 'Item Index'
          expect(current_path).to eq('/indexes')
      end
    end
  end
end
