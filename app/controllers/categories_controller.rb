class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if existing_categories.include?(@category.title.downcase)
      flash[:notice] = "#{@category.title} already exists!"
      redirect_to new_category_path
    elsif @category.save
      flash[:success] = "#{@category.title} added!".upcase
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

    def existing_categories
      Category.pluck(:title).map {|title| title.downcase.strip}
    end

    def category_params
      params.require(:category).permit(:title)
    end

end
