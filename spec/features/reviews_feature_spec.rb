require 'rails_helper'

describe 'Reviews' do 

	before(:each) do
			Restaurant.create(name: 'Duck and Waffle', cuisine: 'English')
		end 

		it 'should be able to leave a review for a Restaurant' do 
			visit '/restaurants'
			click_link "Info"
			fill_in "Reviewer", :with => "Giles Coren"
			choose :rating_5
			fill_in "Review", :with => "I love both ducks and waffles"
			click_button 'Create Review'
			expect(page).to have_content("I love both ducks and waffles")
		end

end