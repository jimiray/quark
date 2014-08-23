module Admin
  class ProfilesController < BaseController

    before_filter :find_user

    def edit

    end

    def update
      @user.attributes = profile_params
      if @user.save
        flash[:notice] = "Your profile has been updated"
        redirect_to edit_admin_profile_path
      else
        render :edit
      end
    end

    private

    def profile_params
      params.require(:user).permit(:name, :email, :twitter_handle, :linked_in_url, :google_plus_url)
    end

      def find_user
        @user = current_user
      end

  end
end