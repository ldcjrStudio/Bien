class UsersController < ApplicationController

def index
@users = User.all
end

def show

    #so that url shows as users/rik
@user = User.find_by(username: params[:id])

end


def new
# form for adding a new user
@user = User.new
end

def create
# take params from the form
@user = User.new(form_params)
# create a new user
# if valid and it dsaves, go to the list users page

        if @user.save
            session[:user_id] = @user.id

            redirect_to root_path
        else
        render "new"

        end

end



def form_params
params.require(:user).permit(:username, :email, :password, :passord_confirmation)


end



end
