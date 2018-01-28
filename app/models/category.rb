class Category < ActiveRecord::Base
  validates :name, presence: true
  
  validates :id, uniqueness: true

  has_many :items
end
