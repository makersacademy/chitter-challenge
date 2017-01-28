# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'sign out' do
  
  before(:each) do
  	User.create(user_name: 'sam',
  				password: 'password',
  				password_confirmation: 'password')
  end	

  scenario 'user can sign out of Chitter' do
	visit '/sessions/new'
    fill_in :user_name, with: 'sam'
    fill_in :password, with: 'password'
    click_button 'Sign in'	
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome to Chitter, sam')
  end

end


