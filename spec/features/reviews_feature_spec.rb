require 'rails_helper'

describe 'Reviews' do 

	before(:each) do
		sign_up("wahoo@yahoo.com", "12345678")
		Restaurant.create(name: 'Duck and Waffle', cuisine: 'English')
		visit '/restaurants'
		click_link "Info"
	end

	context 'when somebody wants to leave a review and they are logged in'

		it 'should be able to leave a review for a Restaurant' do 
			fill_in "Reviewer", :with => "Giles Coren"
			choose 5
			fill_in "Review", :with => "I love both ducks and waffles"
			click_button 'Create Review'
			expect(page).to have_content("I love both ducks and waffles")
			expect(page).to have_content("★★★★★")
		end

		it 'should not be able to leave a review if the rating is not filled in' do 
			fill_in "Reviewer", :with => "Giles Coren"
			click_button 'Create Review'
			expect(page).to have_content("Rating can't be blank")
		end

		it 'the restaurant page should display an average rating' do
			fill_in "Reviewer", :with => "Giles Coren"
			choose 5
			click_button 'Create Review'
			fill_in "Reviewer", :with => "Michael Winner"
			choose 1
			click_button 'Create Review'
			expect(page).to have_content "Average Rating: ★★★☆☆"
		end

	context 'when somebody wants to leave a review and they are not logged in' do 

		before(:each) do 
			sign_out
			click_link "Info"
		end

		it 'they should not be able to leave a review' do 
			fill_in "Reviewer", :with => "Giles Coren"
			choose 5
			fill_in "Review", :with => "I love both ducks and waffles"
			click_button 'Create Review'
			expect(page).not_to have_content("I love both ducks and waffles")
			expect(page).to have_content("Sign in to leave a review")
			end
		end

end