class Admin::SessionsController < Devise::SessionsController

  skip_before_filter :verify_authenticity_token, :only => [:destroy]

  layout 'login'


  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end