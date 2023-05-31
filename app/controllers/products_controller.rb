class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit destroy update]

  def index
    @products = current_user.products
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def set_product
    @product = current_user.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :price, :description)
  end
end
