# File: home_controller.rb
# Description: 
#         main controller for the home page of the application
# Author: Kyle Kilbride
class HomeController < ApplicationController

  # Action: index
  # Description: controller for the main landing page. If the user has invites show a notification
  # Author: Kyle Kilbride
  def index
  	
  	allInvites = Invite.all
  	currentUser = getCurrentUser
  	@numInvites = 0

  	allInvites.each do |i|
  		if currentUser.id == i.user_id && i.response == false 
  			@numInvites = @numInvites + 1
  		end
  	end

  end

end
