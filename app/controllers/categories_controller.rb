class CategoriesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @category_products = @category.products.paginate(page: params[:page], per_page: 5)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Only users can perform that action"
      redirect_to categories_path
    end
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Only admin can perform that action"
      redirect_to categories_path
    end
  end
end
