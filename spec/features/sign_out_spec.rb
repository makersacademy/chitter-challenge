feature 'sign out' do

  scenario 'the person can log out and will be taken back to the homepage' do
  	sign_up
  	click_button 'Sign out'
  	expect(page).to have_link('Log in')
  end

end
