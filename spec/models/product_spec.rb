require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is not valid without any attriube' do
    expect(Product.new).to_not be_valid
  end

  it 'is not valid without product_name' do
    product = Product.new(product_name: nil, price: 4000, description: 'description of first test model.')
    expect(product).to_not be_valid
  end

  it 'is not valid without price' do
    product = Product.new(product_name: 'test_product', price: nil,
                          description: 'desciprtion of third test product.')
    expect(product).to_not be_valid
  end

  it 'is not valid without description' do
    product = Product.new(product_name: 'test_product', price: 6000, description: nil)
    expect(product).to_not be_valid
  end
end
