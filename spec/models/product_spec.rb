require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :each do
      @category = Category.create(name: "Test Category")
      @product = Product.new(name:'Test Product Name', description: 'Test Product Description', image: 'Test Image URL', price_cents: 9999, quantity: 1, category_id: @category.id)
    end 

    it "saves a product succesfully with all 4 attributes present" do
      @new_product = Product.new(name:'Test Product Name', description: 'Test Product Description', image: 'Test Image URL', price_cents: 9999, quantity: 1, category_id: @category.id).save
      expect(@new_product).to eq(true)
    end
    
    it "validates that a product name is present" do
      expect(@product).to be_valid
    end 

    it "throws an error if one field is nil" do
      @product = Product.new(name: nil, description: 'Test Product Description', image: 'Test Image URL', price_cents: 9999, quantity: 1, category_id: @category.id)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end
       

  end
end