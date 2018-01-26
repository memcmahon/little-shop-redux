require_relative '../spec_helper'
require 'pry'
require 'csv'

RSpec.describe Category do
  describe "Validations" do
    it "is invalid without a name" do
      category = Category.create

      expect(category).to_not be_valid
    end
  end

  describe "Database Builder" do
    it "loads csv files" do
      categories = CSV.open("data/categories.csv", headers: true, header_converters: :symbol)
      categories.each do |row|
        Category.create(name: row[:name])
      end
      expect(Category.count).to eq 7
      expect(Category.first.name).to eq "Sleepy"
    end
  end
end
