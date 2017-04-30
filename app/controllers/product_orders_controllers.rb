class ProductOrdersController < ApplicationController
  before_action :require_user

  def index
    @product_orders = ProductOrder.all
  end

  def show

  end

  def new
    @order = Order.new
  end

  def edit

  end

  def create
    if params[:product_id].present?
      @product_order = ProductOrder.new(product_id: params[:product_id], user: current_user)
    else
      @product_order = nil
      flash[:error] = "Product is not available"
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.products.paginate(page: params[:page], per_page: 5)
  end

  def update

  end

  private
  def order_params
    params.require(:order).permit(:quantity)
  end


end
