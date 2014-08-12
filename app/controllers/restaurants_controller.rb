class RestaurantsController < ApplicationController

def index
	@restaurants = Restaurant.all
end

def new
	@restaurant = Restaurant.new
	if !user_signed_in?
		flash[:notice] = "Sign in to add a restaurant!" 
		redirect_to '/restaurants'
	end
end

def create
	@restaurant = Restaurant.new(restaurant_params)
	if @restaurant.save
		redirect_to '/restaurants'
	else
		render 'new'
	end
end

def show
	@restaurant = Restaurant.find(params[:id])
	@review = @restaurant.reviews.build
end

def edit
	@restaurant = Restaurant.find(params[:id])
end

def update
	@restaurant = Restaurant.find(params[:id])
	if @restaurant.update(restaurant_params)
		redirect_to '/restaurants'
	else
		render 'edit'
	end
end

def destroy
	@restaurant = Restaurant.find(params[:id])
	@restaurant.destroy

	redirect_to'/restaurants'
	end

private
	def restaurant_params
		params.require(:restaurant).permit(:name, :cuisine)
	end

end
