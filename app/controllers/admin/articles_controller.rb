module Admin
  class ArticlesController < Admin::BaseController

    #load_and_authorize_resource find_by: :slug
    before_filter :find_or_new_article, except: 'index'

    def index
      @articles = Article.includes(:user).all
    end

    def show; end

    def new; end

    def create
      Rails.logger.debug("artickel is #{params[:article]}")
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

    def destroy
      if @article.destroy
        flash[:notice] = "Article - #{@article.title} deleted"
        redirect_to admin_articles_path
      end
    end

    private

    def find_or_new_article
      @article = params[:id] ? Article.friendly.find(params[:id]) : Article.new
    end

    def article_params
      Rails.logger.debug("Parmas are #{params}")
      params.require(:article).permit(:title, :preview, :body, :featured, :category_id, :image, :published_at)
    end

  end
end
