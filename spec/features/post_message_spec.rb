feature 'post a message' do

	create_user
	
  scenario 'registered user can post a message' do
  	sign_in
  	click_button "New Peep"
  	fill_in :content, with: "Test Message"
  	expect{click_button "PEEP"}.to change{user.peeps.count}.by(1)
  	expect(user.peeps.map(&:content)).to include("Test Message")
  	expect(page).to have_content "You have successfully sent a peep"
    expect(page).to have_content "Test Message"
  end

  scenario 'cannot post a message when not logged in and show error' do
    visit '/peeps/new'
  	fill_in :content, with: "Test Message"
  	expect{click_button "PEEP"}.to_not change{Peep.count}
  	expect(page).to have_content "You need to log in to peep!"
  end

  scenario 'cannot post an empty message' do
  	sign_in
  	click_button "New Peep"
  	fill_in :content, with: " "
  	expect{click_button "PEEP"}.to_not change{user.peeps.count}
  	expect(page).to have_content "Please enter something!"
  end

end

