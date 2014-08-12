require 'rails_helper'

RSpec.describe Review, :type=> :model do

	it 'should not accept a value greater than 5 as a rating' do 
		review = Review.new(rating: 7)
		expect(review).to have(1).error_on(:rating)
	end

		it 'should not accept a value less than 1 as a rating' do 
		review = Review.new(rating: -1)
		expect(review).to have(1).error_on(:rating)
	end

end