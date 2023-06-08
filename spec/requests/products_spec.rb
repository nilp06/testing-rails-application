require 'rails_helper'

RSpec.describe 'Products', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { create :user }
  let(:product) { build :product }
  before(:each) do
    sign_in user
  end

  describe 'GET /products' do
    it 'product index page should get' do
      get products_url
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products/new' do
    it 'prouct creating form should return' do
      get new_product_url
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /products' do
    it 'product should be saved' do
      post products_url,
           params: { product: { product_name: product.product_name, price: product.price,
                                description: product.description } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(products_url)
    end

    it 'product should not be saved' do
      product.product_name = ''
      post products_url,
           params: { product: { product_name: product.product_name, price: product.price,
                                desciption: product.description } }
      expect(response).to have_http_status(422)
      expect(response.body).to include('<h1>Errors</h1>')
    end
  end

  # describe 'PUT /products' do
  #   it 'product should be updated' do
  #   end
  # end
end
