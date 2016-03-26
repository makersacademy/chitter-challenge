feature 'sign out' do

  scenario 'the person can log out and will be taken back to the homepage' do
  	sign_up
  	click_button ("Log out")
  	expect(page).to have_button('Log in')
  end

end
