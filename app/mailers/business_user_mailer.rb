class BusinessUserMailer < ApplicationMailer
    default from: 'no-reply@autotrak.com'
    #default to: 'juanordaz_2011@icloud'

    def new_business_user(business_user)
        @business_user = business_user
        mail(to: business_user.business_user_email,
                subject: 'Welcome to AutoTrak!')
    end


end
