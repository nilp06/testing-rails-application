require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'product should not be saved without attributes' do
    p = Product.new
    assert_not p.save, 'product instance is saving with empty attributes'
  end

  test 'prodcut name should not be empty' do
    p = products(:one)
    assert_not p.save, 'prodcut name should not be empty'
  end
end
