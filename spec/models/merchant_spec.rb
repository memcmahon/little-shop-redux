require_relative '../spec_helper'
require 'pry'
require 'csv'

RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.create(id: 1)

      expect(merchant).to_not be_valid
    end
  end

  describe "Database Builder" do
    it "loads csv files" do
      merchants = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)
      merchants.each do |row|
        Merchant.create(id:         row[:id],
                        name:       row[:name],
                        created_at: row[:created_at],
                        updated_at: row[:updated_at])
      end

      expect(Merchant.count).to eq 475
      expect(Merchant.find_by(name: "Princessfrankknits").id).to eq 12334234
    end
  end
end
