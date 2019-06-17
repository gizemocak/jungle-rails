require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do  

    it "is not valid without a name" do
      category = Category.new(name:'furniture')
      product = category.products.new(
        name: nil,
        price: 100,
        quantity: 23,
      )
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      category = Category.new(name:'furniture')
      product = category.products.new(
        name: "sofa",
        price: nil,
        quantity: 23,
      )
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      category = Category.new(name:'furniture')
      product = category.products.new(
        name: "sofa",
        price: 100,
        quantity: nil,
      )
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product = Product.new(
        name: "sofa",
        price: 100,
        quantity: 23,
      )
      expect(product).to_not be_valid
    end
    
  end
end
