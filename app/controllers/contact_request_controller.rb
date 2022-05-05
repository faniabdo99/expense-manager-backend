class ContactRequestController < ApplicationController
    def PostNew
        #Create new record
        contact_request = ContactRequest.new
        contact_request.name = params[:name]
        contact_request.email = params[:email]
        contact_request.message = params[:message]
        if (contact_request.valid?)
            #All clear
            is_saved = contact_request.save;
            if (is_saved)
                 render json: {
                    :success => true,
                    :message => "Thank you for your message!"
                }, status: 200
            else
                render json: {
                    :success => false,
                    :errors => { error: ["Something went wrong! Please try again later"] }
                }, status: 500
            end
        else
            #Validation error
            render json: {
                :success => false,
                :errors => contact_request.errors
            }, status: 422
        end

    end
end
