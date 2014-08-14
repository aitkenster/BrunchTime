require 'rails_helper' 

	describe 'luvit' do 
		it 'a user should be able to declare they love a review' do 
			sign_up("wahoo@yahoo.com", "12345678")
			add_restaurant("Chipotle", "Mexican")
			click_link("Info")
			add_review("Nicola", 5, "It's alright")
			click_link("Luvit?")
			expect(page).to have_content("1 Brunchers Luvit!")
		end
	end