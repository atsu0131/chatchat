class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    include SessionsHelper

    private
    
    def require_user_logged_in
      unless logged_in?
      flash[:notice] = "権限がありません"
      redirect_to("/tops/index")
      end
    end
end
