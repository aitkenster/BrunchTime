require 'rails_helper'

describe "restaurants" do 

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
		it 'I fill in the new restaurant form' do
			visit '/restaurants/new'
			fill_in "Name", :with => "Chipotle"
			fill_in "Cuisine", :with => "Mexican"
			click_button "Save Restaurant"
			visit '/restaurants'
			expect(page).to have_content("Chipotle")
		end

	end

end