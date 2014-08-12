require 'rails_helper'

describe "restaurants" do 

	before(:each) do
		visit '/users/sign_up'
		fill_in "Email", with: "wahoo@yahoo.com"
		fill_in "Password", with: "12345678"
		fill_in "Password confirmation", with: "12345678"
		click_button "Sign up"
	end

	context 'when there are no restaurants' do
		it "should tell the user there are no restaurants" do  
			visit '/restaurants'
			expect(page).to have_content("There are no restaurants currently listed on BrunchTime")
		end
	end

	context 'when there is a restaurant in the database' do
		
		before(:each) do
			Restaurant.create(name: 'Duck and Waffle', cuisine: 'English')
		end 

		it 'should display the names of the restaurants' do 
			visit '/restaurants'
			expect(page).to have_content("Duck and Waffle")
		end
	end

	context 'when I want to add a new restaurant' do 


		it 'I fill in the new restaurant form correctly' do		 
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in "Name", :with => "Chipotle"
			fill_in "Cuisine", :with => "Mexican"
			click_button "Create Restaurant"
			expect(page).to have_content("Chipotle")
		end

		it 'I get an error and return to the same page when I fill in the form incorrectly' do 
			visit '/restaurants/new'
			fill_in "Name", :with => "Chipotle"
			click_button "Create Restaurant"
			expect(page).to have_content("Please enter the details for the restaurant you wish to add:")
			expect(page).to have_content("Cuisine can't be blank")
		end
	end

	context 'when I want to return to the home page' do 
		it 'I click the home link' do 
			visit '/restaurants/new'
			click_link 'Home'
			expect(page).to have_content("There are no restaurants currently listed on BrunchTime")
		end
	end

	context 'when I want to edit the details of a restaurant' do 

		before(:each) do
			Restaurant.create(name: 'Duck and Waffle', cuisine: 'English')
		end 

		it 'I can change its name' do 
			visit '/restaurants'
			click_link 'Edit'
			fill_in "Name", :with => 'Cow and Waffle'
			click_button 'Update Restaurant'
			expect(page).to have_content('Cow and Waffle')
		end

		it 'I can delete it' do 
			visit '/restaurants'
			click_link 'Delete'
			expect(page).to have_content("There are no restaurants currently listed on BrunchTime")

		end
	end

end