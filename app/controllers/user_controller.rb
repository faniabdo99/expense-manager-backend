class UserController < ApplicationController
    def GetAll
        render json: User.all
    end
    def PostNewUser
        # Validate the incoming request (Model will handle this)
        # Add the user to DB
        
        the_user = User.new
        the_user.name = params['name']
        the_user.email = params['email']
        the_user.password = params['password']
        if (the_user.valid?)
            user_saved = the_user.save
            if(user_saved)
                render json: {
                    :success => true,
                    :message => "User has been saved"
                }, status: 200
            else
                render json: {
                    :success => false,
                    :errors => { error: ["User has not been saved for unknown reason"] }
                }, status: 500
            end
        else
            render json: {
                :success => false,
                :errors => the_user.errors
            }, status: 422
        end
    end
end
