class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
    @articles = @category.articles.decorate
    render template: 'articles/index'
  end

end
