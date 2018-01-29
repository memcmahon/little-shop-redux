require 'pry'

describe "user can create new category" do
  context "visits create new category" do
    it "adds category to category index" do
      category_1 = Category.create(name: "Snow")

      visit '/categories/new'
      fill_in('new-name', :with => 'Evil Step-Mother')
      click_button('new-submit')
      new_category = Category.find_by(name: 'Evil Step-Mother')

      expect(current_path).to eq('/categories')
      expect(Category.all.count).to eq(2)
      expect(page).to have_content('Evil Step-Mother')
      expect(new_category.id).to eq(2)
    end
  end
end
