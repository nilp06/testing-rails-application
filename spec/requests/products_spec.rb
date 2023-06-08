require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    let(:user) { build :user }
    let(:product) {build :product}
    before(:each) do
      sign_in user
    end
    
    it "works! (now write some real specs)" do
      get products_index_path
      expect(response).to have_http_status(200)
    end
  end
end
