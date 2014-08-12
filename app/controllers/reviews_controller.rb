class ReviewsController < ApplicationController

	def create

		@restaurant = Restaurant.find(params[:restaurant_id])
	
		
		@review = @restaurant.reviews.new(review_params)
		if @review.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'restaurants/show'
		end
	end

	# def average_rating
	# 	@restaurant = Restaurant.find(params[:restaurant_id])
	# 	@ratings = @restaurant.reviews.all.map{|review| review.rating}
	# 	@average_rating = (@ratings.inject {|sum, rating| sum + rating})/@ratings.count
	# 	return @average_rating
	# end

	private

		def review_params
			params.require(:review).permit(:reviewer, :review, :rating)
		end

end
