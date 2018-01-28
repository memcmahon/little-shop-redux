require 'pry'

describe "user can delete existing category from index" do
  context "visits category index page" do
    it "deletes an individual category" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")

      expect(Category.all.count).to eq(2)

      visit '/categories'
      click_button('delete', match: :first)

      expect(current_path).to eq('/categories')
      expect(Category.all.count).to eq(1)
      expect(Category.first.name).to eq('Evil Step-Mother')
    end
  end

  context "visits individual merchant page" do
    it "deletes the individual merchant" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")

      expect(Category.all.count).to eq(2)

      visit "/categories/#{category_2.id}"
      click_button('delete')

      expect(current_path).to eq('/categories')
      expect(Category.all.count).to eq(1)
      expect(Category.first.name).to eq('Snow')
    end
  end
end
