# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User signs out' do
  include Helpers

  scenario 'while being signed in' do
    visit '/homepage'
    sign_up
    click_button 'Sign Out'
    expect(page).to have_content('Sign Up or Sign In to peep.')
    expect(page).not_to have_content('Logged in as: tansaku')
  end

end
