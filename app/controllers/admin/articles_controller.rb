class Admin::ArticlesController < Admin::BaseController

  before_filter :find_or_new_article, except: 'index'

  def index
    @articles = Article.includes(:user).all
  end

  def show; end

  def new; end

  def create
    @article.attributes = article_params
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article Created"
      redirect_to admin_articles_path
    else
      render action: 'new'
    end

  end

  def edit; end

  def update
    @article.attributes = article_params
    if @article.save
      redirect_to admin_articles_path
    else
      render action: 'edit'
    end
  end

  def publish
    if @article.publish!
      flash[:notice] = "Article - #{@article.title} published"
      redirect_to admin_articles_path
    end
  end

  def unpublish
    if @article.unpublish!
      flash[:notice] = "Article - #{@article.title} unpublished"
      redirect_to admin_articles_path
    end
  end

  private

  def find_or_new_article
    @article = params[:id] ? Article.friendly.find(params[:id]) : Article.new
  end

  def article_params
    params.require(:article).permit(:title, :body, :feature)
  end

end
