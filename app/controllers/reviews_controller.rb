class ReviewsController < ApplicationController


    #check login can be found in application controller
    before_action :check_login, except: [:index, :show]
    
    def index
        # this is our list page for our reviews
        # finding info from URL
        @price = params[:price]
        @cuisine = params[:cuisine]
        @location = params[:location]

        # start with all the reviews
        @reviews = Review.all

        # filtering by price
        if @price.present?
            @reviews = @reviews.where(price: @price)
        
        end

        # filtering by cuisine
        if @cuisine.present?

            @reviews = @reviews.where(cuisine: @cuisine)
        end

        # filtering by location
        if @location.present?

            @reviews = @reviews.near(@location)

        end

    end


    def new
        # form for adding a new review
        @review = Review.new
    end


    def create
        #Take information from the form and add it to daatabase.
        @review = Review.new(form_params)

        # and then associate it with a user
        @review.user = @current_user

        # Save review to the database
        # we want to check if the model can be saved

        #if it is, back to home page

        #if it isnt, show the new form
        if @review.save
        
            redirect_to root_path

        else 
            # show the view for new.html.erb
            render "new"
        end


    end

    def show 
        # individual review page
        @review = Review.find(params[:id])

    end

    def destroy
    # find the individual review
    @review = Review.find(params[:id])
    # destroy

    if @review.user == @current_user 

    @review.destroy

    end
    # redirect to the home page because there is nothign else to go to.
    redirect_to root_path

    end

    def edit
        # find the individual review (to edit)
    @review = Review.find(params[:id])

    if @review.user != @current_user
        redirect_to root_path

    end

    end


    def update
    # find the individual review
    @review = Review.find(params[:id])


    if @review.user != @current_user
        redirect_to root_path

    else

             # update with the new info from the form
             if  @review.update(form_params)
                # redirect somewhere new
                    redirect_to review_path(@review)
            else
                render "edit"
            end
    end
       
    end


    def form_params
        params.require(:review).permit(:title, :restaurant, :body, :score, :ambiance, :cuisine, :price, :address)

    end



end
