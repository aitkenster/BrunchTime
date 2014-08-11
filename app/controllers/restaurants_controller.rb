class RestaurantsController < ApplicationController

def index
	@restaurants = Restaurant.all
end

def new
	@restaurant = Restaurant.new
end

def create
	@restaurant = Restaurant.new(restaurant_params)
	if @restaurant.save
		redirect_to '/restaurants'
	else
		render 'new'
	end
	
end

private
	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

end
