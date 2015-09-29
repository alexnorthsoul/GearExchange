module Admin
  class CategoriesController < Admin::ApplicationController
    respond_to :html, :json

    helper_method :categories, :category

    def index
      @q = Category.order(name: :asc).ransack(params[:q])
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      @category.save ? flash[:success] = t(:success_she, obj: t(:category), name: @category.name, act: t(:created_she)) : flash[:error] = t(:error)
      respond_with @category, location: admin_categories_url
    end

    def update
      category.update(category_params)
      category.save ? flash[:success] = t(:success_she, obj: t(:category), name: category.name, act: t(:updated_she)) : flash[:error] = t(:error)
      respond_with category, location: admin_categories_url
    end

    def destroy
      category.destroy
      category.destroyed? ? flash[:warning] = t(:success_she, obj: t(:category), name: category.name, act: t(:destroyed_she)) : flash[:error] = t(:error)
      redirect_to admin_categories_url
    end

    private

    def categories
      @categories = @q.result(distinct: true)
    end

    def category
      @category ||= Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description, :parent_id)
    end
  end
end
