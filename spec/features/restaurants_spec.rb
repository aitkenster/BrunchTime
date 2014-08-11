require 'rails_helper'

describe "restautants" do 

scenario 'a message is displayed if there are no restaurants in the database' do
	visit '/restaurants'
	expect(page).to have_content("There are no restaurants currently listed on BrunchTime")
end

end