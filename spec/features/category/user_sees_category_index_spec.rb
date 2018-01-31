require 'pry'

describe "user sees category index" do
  context "visits category index" do
    it "shows the list of cagetories" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")

      visit '/categories'

      expect(current_path).to eq('/categories')
      within("header") do
        expect(page).to have_content('Categories')
      end
      expect(page).to have_content(category_1.name)
      expect(page).to have_content(category_2.name)
    end
  end

  context "click individual category name" do
    it "brings user to individual category show page" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")

      visit '/categories'
      click_link('Snow')

      expect(current_path).to eq("/categories/#{category_1.id}")
    end
  end

  context "click individual category edit link" do
    it "brings user to category edit page" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")

      visit '/categories'
      click_link('Edit', match: :first)

      expect(current_path).to eq("/categories/#{category_1.id}/edit")
    end
  end

  context "click create new category link" do
    it "brings user to create new category page" do
      category_1 = Category.create(name: "Snow")
      category_2 = Category.create(name: "Evil Step-Mother")

      visit '/categories'
      click_link('Create New Category', match: :first)

      expect(current_path).to eq("/categories/new")
    end
  end
end
