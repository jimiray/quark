module Admin
  module Settings
    class CategoriesController < BaseController

      before_filter :find_or_new_category, except: [:index]

      def index
        @categories = Category.all
      end

      def new; end

      def create
        @category.attributes = allowed_params
        if @category.save
          redirect_to admin_settings_categories_path
        else
          render action: :new
        end
      end

      def edit; end

      def update
        @category.attributes = allowed_params
        if @category.save
          redirect_to admin_settings_categories_path
        else
          render action: :edit
        end
      end

      def destroy
        if @category.articles.size == 0
          if @category.destroy
            redirect_to admin_settings_categories_path
          end
        else
          flash[:error] = "Category has posts and cannot be deleted"
          redirect_to admin_settings_categories_path
        end
      end

      private

      def find_or_new_category
        @category = params[:id] ? Category.friendly.find(params[:id]) : Category.new
      end

      def allowed_params
        params.require(:category).permit(:name, :image)
      end

    end
  end
end
