# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'sign out' do


  scenario 'user can sign out of Chitter' do
	sign_up
    sign_in 
    click_button 'Sign out'
    expect(page).not_to have_content('Welcome to Chitter, sam')
  end

end


