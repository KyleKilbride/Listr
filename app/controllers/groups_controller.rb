# Class: GroupsController
# Description: 
#   takes care of the creation, the showing, and listing of groups
class GroupsController < ApplicationController
  # Action: index
  # Description: 
  #   grabs the current user
  #   creates a list of groups that the current user belongs to 
  def index
    @currentUser = User.find(session[:user_id])

    @user_groups = @currentUser.groups.all
  end
  # Action: show
  # Description: 
  #   sets a current group
  #   sets the current group owner
  #   sets the current group owners name 
  def show
    @currentGroup = Group.find(params[:id])
    @groupOwner = User.find(@currentGroup.owner_id)
    @groupOwnerName = @groupOwner.first_name + " " + @groupOwner.last_name
    puts @groupOwnerName
  end
  # Action: new
  # Description: 
  #   if all the parameters are present in the form
  #   create a new group with these parameters and store in database
  #   add the user's owner to the list of group users
  #   redirect to the index page
  def new
    if params[:name].present? && params[:type].present? && params[:description].present? 
      newGroup = Group.create(:name => params[:name], :type_of_group => params[:type], :description => params[:description], :owner_id => session[:user_id], :number_of_members => 1)
      if newGroup
        newGroup.users << User.find(session[:user_id])
        redirect_to(:action => 'index')
      end
    else

    end
  end
  # Action: add_members
  # Description: 
  #   adds new members in the future
  def add_members

  end

  #not sure I am going to need the below actions.
  def edit
  end
  def delete
  end
  
end
