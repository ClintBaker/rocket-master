class ProductsController < ApplicationController
before_action :set_product, only: [:edit, :update, :show, :destroy]

  def index
    @products = Product.paginate(page: params[:page], per_page: 5)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user = User.last
    if @product.save
      flash[:success] = "Product was successfully created"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was successfully updated"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end


  def show
  end

  def destroy
    @product.destroy
    flash[:danger] = "Product was successfully deleted"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:title, :description)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
