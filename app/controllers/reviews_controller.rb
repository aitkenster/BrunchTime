class ReviewsController < ApplicationController

	def create

		@restaurant = Restaurant.find(params[:restaurant_id])
		if !user_signed_in?
			flash[:notice] = "Sign in to leave a review!" 
			redirect_to restaurant_path(@restaurant)
		else
			@review = @restaurant.reviews.new(review_params)
			if @review.save
				redirect_to restaurant_path(@restaurant)
			else
				render 'restaurants/show'
			end
		end
	end

	private

		def review_params
			params.require(:review).permit(:reviewer, :review, :rating)
		end

end
