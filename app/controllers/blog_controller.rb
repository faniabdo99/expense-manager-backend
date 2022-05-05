class BlogController < ApplicationController
    # Return all articles in the DB to the front end
    def GetAll
        render json: Blog.all
    end
    # Create a new article and save it to the DB
    def PostNew
        # Save the article
        blog = Blog.new
        blog.title = params[:title]
        blog.slug = params[:slug].downcase
        blog.description = params[:description]
        blog.article = params[:article]
        if (blog.valid?)
            #Save to DB
            is_saved = blog.save
            if (is_saved)
                #Saved to DB
                render json: {
                    :success => true,
                    :message => "Articles has been saved"
                }, status: 200
            else
                render json: {
                    :success => false,
                    :errors => { error: ["The article has not been saved for unknown reason"] }
                }, status: 500
            end
        else
            #Return Validation Errors
            render json: {
                :success => false,
                :errors => blog.errors
            }, status: 422
        end
    end
    # Get single article
    def GetSingle
        the_article = Blog.find(params[:id])
        render json:  the_article , status: 200
    end
    def PostUpdate
        blog = Blog.find(params[:id])
        blog.title = params[:title]
        blog.description = params[:description]
        blog.article = params[:article]
        if (blog.valid?)
            #Save to DB
            is_saved = blog.save
            if (is_saved)
                #Saved to DB
                render json: {
                    :success => true,
                    :message => "Articles has been updated"
                }, status: 200
            else
                render json: {
                    :success => false,
                    :errors => { error: ["The article has not been updated for unknown reason"] }
                }, status: 500
            end
        else
            #Return Validation Errors
            render json: {
                :success => false,
                :errors => blog.errors
            }, status: 422
        end
    end
end
