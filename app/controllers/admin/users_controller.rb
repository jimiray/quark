module Admin
  class UsersController < Admin::BaseController

    before_filter :find_or_new_user, except: [:index]

    def index
      @users = User.where("encrypted_password != ''")

      @invited_users = User.where("encrypted_password = ''")
    end

    def show; end

    def new; end

    def create
      if User.invite!({email: params[:user][:email],
                       name: params[:user][:name]},
                      current_user)
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