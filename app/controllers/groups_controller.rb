# Class: GroupsController
# Description: 
#   takes care of the creation, the showing, and listing of groups
class GroupsController < ApplicationController

  # choose a different layout 
  layout 'group' 
  
  # Action: index
  # Description: 
  #   grabs the current user
  #   creates a list of groups that the current user belongs to 
  def index
    @currentUser = getCurrentUser
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
    @currentUser = getCurrentUser
    #get the group id
    #get the user_id that match with that group
    #add it to a list
    @group_users = @currentGroup.users 
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

  # Action: addUser
  # Description: 
  #   provides data for the addUser view.
  # Author: Kyle Kilbride
  def addUser
    @users = User.all
    @currentUser = getCurrentUser  
    @currentGroup = User.find(params[:id])
  end
  # Action: try_to_add_group
  # Description: 
  #   retrieves a list of users to add to a users group. If the group is not empty
  #   for each invited user generate an invite, then redirect back to the group.
  #   
  # Author: Kyle Kilbride
  def try_add_to_group
    @invitedUsers = User.find(params[:user_ids])
    group = Group.find(params[:id])
    
    if(@invitedUsers.any?)
      @invitedUsers.each do |u|
        invite = Invite.new
        u.invites << invite  
        group.invites << invite
      end
    end

    redirect_to(:action => "show", :id => group.id) 
  end
  
  # action: invites
  # description:
  #     invites grabs all the invites that belong to the logged in user, if they have not accepted or declined it the
  #     they have the option to. 
  #  
  # author: Kyle Kilbride
  def invites
    # get all invites
    allInv = Invite.all
    # get the current user
    currentUser = getCurrentUser
    puts currentUser.first_name
    # create a new array for the invites that belong to this user
    @groupInvites = Array.new
    # iterate through this list to find ones that have not been responded to
    allInv.each do |i|
      # if the current user's id and the id on the invite match AND they have not responded add to the array
      if currentUser.id == i.user_id && i.response == false 
        group = Group.find(i.group_id)
        @groupInvites.push group
        puts "group name added: " + group.name
      end
    end
  end

  # action: accept_invite
  # description: 
  #   when a user accepts the invite sent to them, add them to the group so it shows up in the groups page and
  #   flags the invite as responded
  #   
  # author: Kyle Kilbride
  def accept_invite
    user = getCurrentUser
    group = Group.find(params[:id])
    invite = Invite.where('user_id' => user.id).where('group_id' => group.id).take!
    puts invite
    # change the response flag in database to be true
    invite.response = true
    # update table entry
    invite.save
    #redirect to invites page
    # add user to group
    group.users << user
    redirect_to(:controller => 'groups', :action => 'invites', :id => session[:user_id])
  end

  # action: decline_invite
  # description: 
  #   when a user declines the invite sent to them, does not add them to the group and flags the invite as responded
  #   
  # author: Kyle Kilbride
  def decline_invite
    user = getCurrentUser
    group = Group.find(params[:id])
    invite = Invite.where('user_id' => user.id).where('group_id' => group.id).take!
    puts invite
    # change the response flag in database to be true
    invite.response = true
    invite.save
    redirect_to(:controller => 'groups', :action => 'invites', :id => session[:user_id])
  end

end
