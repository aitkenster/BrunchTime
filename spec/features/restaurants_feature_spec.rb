require 'rails_helper'

describe "restaurants" do 

	before(:each) do
		sign_up("wahoo@yahoo.com", "12345678")
		visit '/restaurants'
	end

	context 'when there are no restaurants' do
		it "should tell the user there are no restaurants" do  
			expect(page).to have_content("There are no restaurants currently listed on BrunchTime")
		end
	end

	context 'when there is a restaurant in the database' do
		
		it 'should display the names of the restaurants' do 
			Restaurant.create(name: 'Duck and Waffle', cuisine: 'English')
			visit '/restaurants'
			expect(page).to have_content("Duck and Waffle")
		end

	end

	context 'when I want to add a new restaurant' do 

		it 'I fill in the new restaurant form correctly' do		
			click_link 'Add a restaurant'
			fill_in "Name", :with => "Chipotle"
			fill_in "Cuisine", :with => "Mexican"
			click_button "Create Restaurant"
			expect(page).to have_css 'td', text: 'Chipotle'
		end

		it 'I get an error and return to the same page when I fill in the form incorrectly' do 
			visit '/restaurants/new'
			fill_in "Name", :with => "Chipotle"
			click_button "Create Restaurant"
			expect(page).not_to have_css 'td', text: 'Chipotle'
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

	context 'when I want to edit the details of a restaurant Ive created' do 

		before(:each) do 
			add_restaurant("Chipotle", "Mexican")
		end

		it 'I can change its name' do 
			click_link 'Edit'
			fill_in "Name", :with => 'Cow and Waffle'
			click_button 'Update Restaurant'
			expect(page).to have_content('Cow and Waffle')
		end

		it 'I can delete it' do 
			click_link 'Delete'
			expect(page).to have_content("There are no restaurants currently listed on BrunchTime")
		end
	end

	xcontext 'when I want to edit the details of a restaurant I havent created' do 
			before(:each) do 
				Restaurant.create(name: 'TGI Fridays', cuisine: 'American')
				visit '/restaurants'
			end

		it 'I should not be able to get to the edit page' do 
			sign_out
			sign_up("gotmail@hotmail.com", "12345678")
			expect(page).not_to have_content('Edit')
		end 

	end
context 'phantom' do
	it 'testing phantom', js:true do 

	end
end

end