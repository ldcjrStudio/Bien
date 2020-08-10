class CommentsController < ApplicationController

    def create
        # review_id comes from our route.db
       @review = Review.find(params[:review_id]) 
       @comment = @review.comments.new(params.require(:comment).permit(:body))

       @comment.user = @current_user
       @comment.save
       redirect_to review_path(@review)
    end

end
