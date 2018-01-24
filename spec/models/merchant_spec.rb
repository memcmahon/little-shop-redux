require 'pry'

RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.create(name: "Sally")
      binding.pry
      expect(merchant).to_not be_valid
    end
  end
end
