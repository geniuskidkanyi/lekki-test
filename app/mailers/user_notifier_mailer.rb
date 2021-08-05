class UserNotifierMailer < ApplicationMailer


    def send_user_status_email(user)
        @user = user

        mail( :to => @user.email,
        :subject => "Your account is now #{@user.user_status}" )
     end


end
