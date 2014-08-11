class RestaurantsController < ApplicationController

def index
	@restaurants = Restaurant.all
end

def new
end

def create
	@restaurant = Restaurant.new(restaurant_params)
	@restaurant.save

	redirect_to '/restaurants'
	
end

private
	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

end
