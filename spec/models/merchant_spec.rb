require 'pry'

RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.create(created_at: "2010-12-10", updated_at: "2011-12-04")

      expect(merchant).to_not be_valid
    end
  end
end
