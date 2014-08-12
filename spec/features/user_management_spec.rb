require 'rails_helper'

describe 'user authentiction' do 

	it 'gives the user the option to log in on the home page when they are not signed in' do 
		visit '/restaurants'
		click_link 'Sign In'
		expect(page).to have_content("Remember me")
	end

	it 'gives the user the option to sign up when they are not signed in' do 
		visit '/restaurants'
		click_link 'Sign Up'
		expect(page). to  have_content("Password confirmation")
	end

end