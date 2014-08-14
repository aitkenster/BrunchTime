require 'rails_helper' 

	describe 'luvit' do 

		before(:each) do 
			sign_up("wahoo@yahoo.com", "12345678")
			add_restaurant("Chipotle", "Mexican")
			click_link("Info")
			add_review("Nicola", 5, "It's alright")
		end

		it 'a user should be able to declare they love a review', js: true do 
			click_link("Luvit?")
			expect(page).to have_content("1 Brunchers Luvit!")
		end

		it 'if there are no luvits, the number of luvits should not be displayed' do 
			expect(page).not_to have_content("0 Brunchers Luvit!")
		end
	end