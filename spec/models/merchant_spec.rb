require 'pry'

RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without an  id" do
      merchant = Merchant.create(name: "Sally")

      expect(merchant).to_not be_valid
    end

    it "is invalid without a name" do
      merchant = Merchant.create(id: 1)

      expect(merchant).to_not be_valid
    end
  end
end
