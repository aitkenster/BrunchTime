def sign_up(email, password)
	visit '/users/sign_up'
	fill_in "Email", with: email
	fill_in "Password", with: password
	fill_in "Password confirmation", with: password
	click_button "Sign up"
end

def sign_in(email, password)
	visit '/restaurants'
	click_link 'Sign In'
	fill_in "Email", with: email
	fill_in "Password", with: password
	click_button "Sign in"
end

def sign_out
	visit '/restaurants'
	click_link 'Sign Out'
end

def add_restaurant(name, cuisine)
	click_link 'Add a restaurant'
	fill_in "Name", :with => name
	fill_in "Cuisine", :with => cuisine
	click_button "Create Restaurant"
end

def add_review(reviewer, rating, review)
	fill_in "Reviewer", :with => reviewer
	choose rating
	fill_in "Review", :with => review
	click_button 'Create Review'
end
