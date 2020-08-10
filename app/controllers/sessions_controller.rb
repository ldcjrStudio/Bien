class SessionsController < ApplicationController

    def new
    # login form    
    
    end

    def create
# actually try log in and out
        @form_data = params.require(:session)

        # pull out the username and password from teh form data.
        @username = @form_data[:username]
        @password = @form_data[:password]

        # lets check the user is who they say they are

        @user = User.find_by(username: @username).try(:authenticate, @password)

        # if there is a user present, redirect to homepage

            if @user 


                session[:user_id] = @user.id


            redirect_to root_path

            else render "new"
            end 
    end

    def destroy


        # log out

        # remove the session completely(built in with rails)

        reset_session

        #redirect to login page

        redirect_to new_session_path
    end


end
