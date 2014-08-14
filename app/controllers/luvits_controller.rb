class LuvitsController < ApplicationController
	def create
		@review = Review.find(params[:review_id])
		@review.luvits.create

		@restaurant = @review.restaurant_id
		redirect_to restaurant_path(@restaurant)
	end
end
