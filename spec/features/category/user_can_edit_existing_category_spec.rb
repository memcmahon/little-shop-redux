require 'pry'

describe "user can edit existing category" do
  context "visits category edit page" do
    it "edits the name of the category" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")


      visit "/categories/#{category_1.id}/edit"
      fill_in('edit-name', :with => 'Snow White')
      click_button('edit-submit')
      edited_category = Category.find_by(name: 'Snow White')

      expect(current_path).to eq("/categories/#{category_1.id}")
      expect(page).to have_content('Snow White')
      expect(Category.all.count).to eq(2)
    end
  end
end
