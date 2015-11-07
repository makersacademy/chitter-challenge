# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Log out of Chitter' do
  before do
     sign_up
     log_in
  end

  # As a Maker
  # So that I can log out
  # I want to click on logout and receive confirmation of log out
  scenario 'I want to click on logout and receive confirmation of loggin out' do
    click_button('Sign out')
    expect(page).not_to have_content('Welcome, Peter Jackson!')
    expect(page).to have_content('Welcome to Chitter.')
  end

end
