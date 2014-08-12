require 'rails_helper'

describe 'user authentiction' do 

	it 'will not let a user add a restaurant without logging in' do
		 visit '/restaurants'
		 expect(page).not_to have_content("Add a restaurant")
	end

	# it 'will not let a user add a review without logging in' do 
	# end

end