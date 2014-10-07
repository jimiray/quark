module Admin
  class UsersController < Admin::BaseController

    before_filter :find_or_new_user, except: [:index]

    def index
      @users = User.accepted
      @invited_users = User.invited
    end

    def show; end

    def new; end

    def create
      if User.invite!(invite_user_params, current_user)
        flash[:notice] = "User - #{@user.name} has been invited"
        redirect_to admin_users_path
      else
        render action: :new
      end
    end

    def edit; end

    def update
      @user.attributes = user_params
      if @user.save
        flash[:notice] = "User - #{@user.name} updated"
        redirect_to admin_users_path
      else
        redner action: :edit
      end
    end

    def destroy
      if @user.destroy
        flash[:notice] = "User - #{@user.name} deleted"
        redirect_to admin_users_path
      end
    end

    private

    def invite_user_params
      params.require(:user).permit(:name, :email, :roles)
    end

    def user_params
      params.require(:user).permit(:name, :email, :twitter_handle,
                                   :linked_in_ur, :google_plus_url, :roles)
    end


    def find_or_new_user
      @user = params[:id] ? User.friendly.find(params[:id]) : User.new
    end

  end
end
