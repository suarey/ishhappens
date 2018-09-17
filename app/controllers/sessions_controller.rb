class SessionsController < ApplicationController

    def new 
        # Nothing to do here other than render.html.erb
    end 

    def create 

        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            # Successful log in!
            session[:user_id] = user.id 
            # notice: is a special flash[:notice] accessor
            redirect_to root_path, notice: 'Logged in!'
        else 
            # flash.now is used for messaging
            # during the CURRENT request

        flash.now.alert = 'Invalid login credentials - try again!'
        render :new 
        end 
    end 

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out!"
    end 

end 