require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	let(:restaurant){Restaurant.create(name: "Chipotle", cuisine: "Mexican")}
	
describe 'validations' do 
	it 'is not valid with a name of < 3 characters' do 
		restaurant = Restaurant.new(name: 'ab')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid with a cuisine of < 3 characters' do 
		restaurant = Restaurant.new(cuisine: 'ii')
		expect(restaurant).to have(1).error_on(:cuisine)
	end

end

	describe '#average_rating' do 
	 	context 'no reviews' do 
	 		it 'returns N/A' do 
	 			expect(restaurant.average_rating).to eq 'N/A'
	 		end
	 	end

	 	context '1 review' do
	 		it 'returns that rating' do 
	 			restaurant.reviews.create(reviewer: "me", rating: 4)
	 			expect(restaurant.average_rating).to eq 4
	 		end
		end
		context 'average is a float' do 
			it 'returns a float instead of a whole number' do 
				restaurant.reviews.create(reviewer: "me", rating: 4)
				restaurant.reviews.create(reviewer: "me", rating: 5)
				expect(restaurant.average_rating).to eq 4.5
			end
		end
	end


end