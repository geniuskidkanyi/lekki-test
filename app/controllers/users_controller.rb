class UsersController < ApplicationController
  include JSONAPI::Errors
  include JSONAPI::Deserialization
  def index
    
    # binding.pry
    
    user_status = ["archived", "unarchived"]
    params_val = params[:user_status] if params
    
    unless params_val.blank?
      user_status = params_val.split(',')
    end    
    
    render jsonapi: User.where(user_status: user_status)
  end

  def archive_user
    
    # binding.pry
    user_id =  params[:user_id]
    user = User.where(id:user_id).first
    if !user.blank? && user.id != current_user.id
      user.update_attribute("user_status", "archived")
      render jsonapi: user, status: :created 
    else
      render json: { error: 'Invalid user/ cant archive self' }, status: :unprocessable_entity
    end
       
  end

  def unarchive_user
    user_id =  params[:user_id]
    user = User.where(id:user_id).first
    if !user.blank? && user.id != current_user.id
      user.update_attribute("user_status", "unarchived")
      render jsonapi: user, status: :created 
    else
      render json: { error: 'Invalid user/ cant unarchive self' }, status: :unprocessable_entity
    end
  end
  



  

end
