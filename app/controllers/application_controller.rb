class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action describes what method to call before accessing any of the other action.
  # In this case we want to validate that the user is currently logged in via session variables
  before_action :confirm_logged_in, :except => [:login, :try_login, :logout, :register, :try_register]

  private 
  # Action: confirm_logged_in
  # Description: 
  # 	Called by before_action to verify that the user still exists in the session
  # 	If the user does not it redirects them to the login page. 
  #  Restricting their access to certain parts of the application. 	
  def confirm_logged_in
  	unless session[:user_id]
  		redirect_to(:controller => 'access', :action => 'login')
  		return false
  	else
     
  		return true
  	end
  end
end
