class UserNotifierMailer < ApplicationMailer
    def send_signup_email(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Muchas gracias, por registrarte en VinylSwapp' )
    end
    
    def send_completed_swap_email(user_member, email_admin)
        @user = user_member
        @email = email_admin

        mail( :to => @user.email,
        :subject => '¡Felicitaciones! Haz concretado un trueque.' )
    end
end