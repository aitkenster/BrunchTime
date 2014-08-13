require 'rails_helper'

describe 'user options' do 

	before(:each) do 
		visit '/restaurants'
	end

	context 'when a user is not signed in' do 	
		it 'gives the user the option to log in on the home page when they are not signed in' do 
			click_link 'Sign In'
			expect(page).to have_content("Remember me")
		end
		it 'gives the user the option to sign up when they are not signed in' do 
			click_link 'Sign Up'
			expect(page).to  have_content("Password confirmation")
		end
		it 'does not allow the user to add a restaurant' do 
			click_link 'Add a restaurant'
			expect(page).not_to have_content("Please enter the details for the restaurant you wish to add:")
			expect(page).to have_content("Sign in to add a restaurant!")
		end
	end

	context 'when a user is already signed in' do 
		before(:each) do
			visit '/users/sign_up'
			fill_in "Email", with: "wahoo@yahoo.com"
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"
			click_button "Sign up"
		end
		it 'gives the user the option to sign-out when they are signed in' do 
			click_link("Sign Out")
			expect(page).to have_content("Sign In")
		end

	end

end