# File: user_controller
# Description: 
# 			controller that takes care of all user logic. 
# Author: Kyle Kilbride
class UserController < ApplicationController

	def index
	end

	# Action: show
	# Description: shows the users
	# Author: Kyle Kilbride
	def show
		@user = User.find(params[:id])
	end

	# Action: edit
	# Description: edits the user
	# Author: Kyle Kilbride	
	def edit
	    @user = User.find(params[:id])
	    puts @user.first_name
	    if @user.update_attributes(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email])
	    	#handle it
	    	redirect_to @user 
	    end

	end

	def update
	end
    
    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
