module Admin
  class UsersController < Admin::BaseController

    before_filter :find_or_new_user, except: [:index]

    def index
      @users = User.all
    end

    def show; end

    def new; end

    def create
      @user.attributes = user_params
      if @user.save
        flash[:notice] = "User - #{@user.name} created"
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
      if @user.disable!
        flash[:notice] = "User - #{@user.name} disabled"
        redirect_to users_path
      end
    end

    private

    def find_or_new_user
      @user = params[:id] ? User.friendly.find(params[:id]) : User.new
    end

  end
end