class GroupsController < ApplicationController

  def index
    currentUser = User.find(session[:user_id])

    @user_groups = currentUser.groups.all
  end

  def show
    @currentGroup = Group.find(params[:id])
    @groupOwner = User.find(@currentGroup.owner_id)
    @groupOwnerName = @groupOwner.first_name + " " + @groupOwner.last_name
    puts @groupOwnerName
  end

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

  def add_members
    
  end

  #not sure I am going to need the below actions.
  def edit

  end

  def delete

  end
  
end
