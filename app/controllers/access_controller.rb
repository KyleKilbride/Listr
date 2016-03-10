# class: AccessController
# description: Takes care of all the login, logout, and register duties
# Author: Kyle Kilbride 2016
class AccessController < ApplicationController

  # Action: index
  def index
  	# display text and links
  end

  # Action: login
  def login
  	# login form
  end

  # Action: try_login
  # Description: 
  # 	Attempts to log the user in. 
  #  	If their parameters are present, searches for user in database
  #   	If the user is found it then authenticates them against their password
  #    	If successful login, redirects to index, otherwise back to login page.
  def try_login
  	if params[:email].present? && params[:password].present?
  		user_found = User.where(:email => params[:email]).first
  		if user_found
  			authorized_user = user_found.authenticate(params[:password])
  		end
  	end
  	if authorized_user
      session[:user_name] = authorized_user.first_name + " " + authorized_user.last_name
  		session[:user_id] = authorized_user.id
  		session[:user_email] = authorized_user.email
  		redirect_to(:controller => 'home', :action => 'index')
  	else
  		redirect_to(:action => 'login')
  	end
  end

  # Action: logout
  # Description: 
  # 	logs the user out by changing their session variables to nil, redirects to login. 
  def logout
  	session[:user_id] = nil
  	session[:user_email] = nil
  	redirect_to(:action => 'login')
  end

  # Action: register
  def register
  	# register form
  end

  # Action try_register
  # Description:
  # 	attempts to register the user, 
  #  If the parameters are present the user is added to the database
  #  and redirected to the index page.
  def try_register
  	#attempt to register
  	if params[:first_name].present? && params[:last_name].present? && params[:email].present? && params[:password].present?
  		new_user = User.create(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
  		if new_user
		session[:user_id] = new_user.id
		session[:user_email] = new_user.email
  		redirect_to(:controller => 'home', :action => 'index')
  		end
  	end
  end

end
