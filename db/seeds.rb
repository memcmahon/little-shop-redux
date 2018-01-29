require 'pry'
require 'csv'
require_relative '../app/models/merchant.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/item.rb'


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

items = CSV.open("data/items.csv", headers: true, header_converters: :symbol)
items.each do |row|
  Item.create(id:           row[:id],
              title:        row[:name],
              description:  row[:description],
              price:        row[:unit_price].to_i,
              image:        "http://www.yourwdwstore.net/thumbnail.asp?file=assets/images/4/40000/4000/600/44649.jpg&maxx=300&maxy=0",
              merchant_id:  row[:merchant_id],
              created_at:   row[:created_at],
              updated_at:   row[:updated_at],
              category_id:  rand(1..7))
end
