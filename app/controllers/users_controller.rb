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
    if !user.blank? && user.id != current_user.id && user.unarchived?
      user.update_attribute("user_status", "archived")
      UserNotifierMailer.send_user_status_email(user).deliver
      render jsonapi: user, status: :created 
    else
      render json: { error: 'Invalid user/ cant archive' }, status: :unprocessable_entity
    end
       
  end

  def unarchive_user
    user_id =  params[:user_id]
    user = User.where(id:user_id).first
    if !user.blank? && user.id != current_user.id && user.archived?
      user.update_attribute("user_status", "unarchived")
      UserNotifierMailer.send_user_status_email(user).deliver
      render jsonapi: user, status: :created 
    else
      render json: { error: 'Invalid user/ cant unarchive' }, status: :unprocessable_entity
    end
  end
  



  

end
