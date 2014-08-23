class ArticlesController < ApplicationController

  decorates_assigned :article

  def index
    @articles = Article.all.decorate
  end

  def show
    @article = Article.friendly.find(params[:id]).decorate
  end

end
