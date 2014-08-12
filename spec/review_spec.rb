require 'rails_helper'

describe 'reviews' do 

	before(:each) do
		@akbars = Restaurant.new(name: "akbars", cuisine: "Indian")
	end

	it 'should not accept a value greater than 5 as a rating' do 
		Review.create(reviewer: "Nicola", review: "Tasty", rating: 7)
		expect(Review.all.count).to eq 0
	end

end