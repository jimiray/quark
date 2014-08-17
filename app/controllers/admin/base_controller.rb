module Admin

  class BaseController < ApplicationController

    before_filter :authenticate_user!
    before_filter :verify_admin

    layout 'admin'

    private

    def verify_admin
      return true
    end

  end
end
