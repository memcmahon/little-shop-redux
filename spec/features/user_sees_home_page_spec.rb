require 'pry'

describe "user sees home page" do
  context "visit root page" do
    it "shows the dashboard" do
      visit '/'

      expect(current_path).to eq('/')
        within("header") do
        expect(page).to have_content('Shop With No Name')
      end
    end
  end

  context "user can navigate from root to merchant index" do
    it "has functional link for merchants" do
      visit '/'

      expect(current_path).to eq('/')
      within("nav") do
        click_link 'Merchant Index'
        expect(current_path).to eq('/merchants')
      end
    end
  end

  context "user can navigate from root to category index" do
    it "has functional link for categories" do
      visit '/'

      within("nav") do
        click_link 'Category Index'
        expect(current_path).to eq('/categories')
      end
    end
  end

  context "user can navigate from root to item index" do
    it "has functional link for items" do
      visit '/'

      within("nav") do
        click_link 'Item Index'
        expect(current_path).to eq('/items')
      end
    end
  end
end
