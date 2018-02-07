class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 5)
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
end