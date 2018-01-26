require 'pry'
require 'csv'
require_relative '../app/models/merchant.rb'

merchants = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)
merchants.each do |row|
  Merchant.create(id:         row[:id],
                  name:       row[:name],
                  created_at: row[:created_at],
                  updated_at: row[:updated_at])
end

categories = CSV.open("data/categories.csv", headers: true, header_converters: :symbol)
categories.each do |row|
  Category.create(name: row[:name])
end
