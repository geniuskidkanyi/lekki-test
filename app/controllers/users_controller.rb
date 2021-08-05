class UsersController < ApplicationController
  def index
    render jsonapi: User.all
  end

  def archive_user
    user = current_user
    user.update_attribute("user_status", "archived")
    render jsonapi: user, status: :created    
  end

  def unarchive_user
    user = current_user
    user.update_attribute("user_status", "archived")
    render jsonapi: user, status: :created    
  end
  
end
