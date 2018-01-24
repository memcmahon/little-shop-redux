class Merchant < ActiveRecord::Base
  validates :name, :created_at, :updated_at, presence: true

end
