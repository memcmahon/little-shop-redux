require 'pry'

describe "user sees new category page" do
  context "visit categories/new" do
    it "shows the new category form" do
      visit '/categories/new'
      expect(current_path).to eq('/categories/new')
      expect(page).to have_content('Enter a new category:')
    end
  end

  context "has submit button" do
    it "has submit button" do
      visit '/categories/new'
      expect(current_path).to eq('/categories/new')
      expect(page).to have_selector('input[type=submit]')
    end
  end

  context "user can enter new category name" do
    it "can accept new category name" do
      visit '/categories/new'
        page.fill_in 'category[name]', with: "Small"
    end
  end
end
