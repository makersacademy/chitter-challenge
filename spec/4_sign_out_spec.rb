# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User signs out' do
  scenario 'while being signed in' do
    sign_up
    login
    click_button 'Sign out'
    expect(page).not_to have_content('Welcome, Unai Motriko Gomez')
  end
end
