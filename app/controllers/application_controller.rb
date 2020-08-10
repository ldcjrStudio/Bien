class ApplicationController < ActionController::Base

protect_from_forgery with: Exception


#before any page loads, find the current_user

before_action :find_current_user

def find_current_user 

    if session[:user_id].present?

    @current_user = User.find(session[:user_id])

    else
@current_user = nil
    end


end

end
