class ApplicationController < ActionController::API
        include ActionController::Cookies
        include ActionController::RequestForgeryProtection
        protect_from_forgery with: :exception

        # before_action :set_csrf_cookie
        skip_before_action :verify_authenticity_token

        helper_method :current_user, :logged_in

        def current_user 
                @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end

        def logged_in 
                !!current_user
        end

        # private

        # def set_csrf_cookie
        #         cookies["CSRF-TOKEN"] = form_authenticity_token
        # end

end
