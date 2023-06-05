require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'product should not be saved without attributes' do
    p = Product.new
    assert_not p.save, 'product instance is saving with empty attributes'
  end

  test 'prodcut name should be present' do
    p = products(:one)
    assert_not p.save, 'prodcut name should be present'
  end

  test 'product price should be present' do
    p = products(:two)
    assert_not p.save, 'product price should be present'
  end

  test 'product description should be present' do
    p = products(:three)
    assert_not p.save, 'product description should be present'
  end

  test 'product name should be valid.' do
    p = products(:four)
    assert_not p.save, 'product name should be valid.'
  end

  test 'product price should be valid' do
    p = products(:five)
    assert_not p.save, 'product price should be valid.'
  end

  test 'product description should be valid' do
    p = products(:six)
    assert_not p.save, 'product description should be valid.'
  end

  test 'product with all valid attributes should be saved.' do
    p = products(:seven)
    assert p.save, 'product with all valid attributes should be saved.'
  end
end
