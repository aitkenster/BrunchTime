class ReviewsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = @restaurant.reviews.create(review_params)
		redirect_to restaurant_path(@restaurant)
	end

	private

		def review_params
			# raise params.inspect
			params.require(:review).permit(:reviewer, :review, :rating)
		end

end
