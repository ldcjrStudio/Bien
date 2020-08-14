class ApplicationController < ActionController::Base

protect_from_forgery with: Exception


#before any page loads, find the current_user

before_action :find_current_user

#add in method to use in views

helper_method :is_logged_in?

def find_current_user 

    if session[:user_id].present?

    @current_user = User.find(session[:user_id])

    else
    @current_user = nil

    end

#check login statuc=s
    def check_login

        unless is_logged_in?
            redirect_to new_session_path
        end

    end


    #is the person logged in
    def is_logged_in?

        session[:user_id].present?
    end


    #check login status

    def check_admin
        @user = find_current_user

        unless @user.present? and @user.is_admin?
            redirect_to root_path
        end

    end

end

end
