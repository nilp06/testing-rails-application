require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @product = products(:seven)
  end

  test 'should get index' do
    get products_url
    assert_response :success
    assert_select 'table'
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
    assert_select 'form'
  end

  test 'should get show' do
    get product_url(@product)
    assert_response :success
  end

  test 'can create valid product' do
    assert_difference 'Product.count', 1 do
      post products_url,
           params: { product: { product_name: 'test_product9', price: 7000, description: 'product desciption seven.' } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'th', { count: 4 }
  end

  test 'can not create invalid product' do
    post products_url,
         params: { product: { product_name: 'test_product9', price: 400, description: 'product description seven.' } }
    assert_response :unprocessable_entity
    assert_select 'div.alert'
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
    assert_select 'form'
  end

  test 'should update product' do
    put product_url(@product),
        params: { product: { product_name: 'updated product name', price: 9000,
                             desciption: 'updated product description' } }
    assert_response :redirect
    assert_redirected_to product_url(@product)
    follow_redirect!
    assert_select 'table tbody', 1
  end

  test 'should not update product' do
    put product_url(@product),
        params: { product: { product_name: 'updated product name', price: 60,
                             desciption: 'updated product description' } }
    assert_response :unprocessable_entity
    assert_select 'div.alert'
  end

  test 'should destroy product' do
    assert_difference 'Product.count', -1 do
      delete product_url(@product)
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'table'
  end
end
