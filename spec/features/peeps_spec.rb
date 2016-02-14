feature " allows a logged in user to create a peep" do
  scenario "create peep" do
  	register
  	log_in
  	fill_in('content', with: "This is my first peep")
		click_button('Peep!')
    expect(page).to have_content("This is my first peep")
  end
end



feature " allows all users to see a peep" do
  scenario "peeps are visable to all users" do
 		register
  	log_in
  	peep
  	click_button('Log Out')
    visit '/peeps'
    expect(page).to have_content("This is my first peep")
  end
end
