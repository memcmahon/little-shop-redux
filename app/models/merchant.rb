class Merchant < ActiveRecord::Base
  validates :id, :name, presence: true

end
