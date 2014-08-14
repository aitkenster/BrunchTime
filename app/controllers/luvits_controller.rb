class LuvitsController < ApplicationController
	def create
		@review = Review.find(params[:review_id])
		@review.luvits.create

		render json: { new_luvits_count: @review.luvits.count }
	end
end
