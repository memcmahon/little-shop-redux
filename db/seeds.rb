require 'pry'
require 'csv'
require_relative '../app/models/merchant.rb'

contents = CSV.open("data/merchants.csv", headers: true, header_converters: :symbol)
contents.each do |row|
  Merchant.create(id:         row[:id],
                  name:       row[:id],
                  created_at: row[:created_at],
                  updated_at:  row[:updated_at])
end
