feature 'post a message' do

	create_user
	
  scenario 'registered user can post a message' do
  	sign_in
  	click_button "New Peep"
  	fill_in :content, with: "Test Message"
  	expect{click_button "PEEP"}.to change{user.peeps.count}.by(1)
  	expect(page).to have_content "You have successfully sent a peep"
  end
end

