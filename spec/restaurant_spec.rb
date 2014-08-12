require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	
	it 'is not valid with a name of < 3 characters' do 
		restaurant = Restaurant.new(name: 'ab')
		expect(restaurant).to have(1).error_on(:name)
	end

	it 'is not valid with a cuisine of < 3 characters' do 
		restaurant = Restaurant.new(cuisine: 'ii')
		expect(restaurant).to have(1).error_on(:cuisine)
	end

end