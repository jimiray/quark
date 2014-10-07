module Admin
  class PagesController < Admin::BaseController

    before_filter :find_or_new_page

    def index
      @pages = Page.all
    end

    def new; end

    def create
      @page.attributes = page_params
      @page.user = current_user
      if @page.save
        flash[:notice] = "Page - #{@page.title} created"
        redirect_to admin_pages_path
      else
        render action: 'new'
      end
    end

    def edit; end

    def update
      @page.attributes = page_params
      if @page.save
        flash[:notice] = "Page - #{@page.title} created"
        redirect_to admin_pages_path
      else
        render action: 'edit'
      end
    end

    def destroy; end

    private

    def page_params
      params.require(:page).permit(:title, :body)
    end

    def find_or_new_page
      @page = params[:id] ? Page.friendly.find(params[:id]) : Page.new
    end

  end
end
