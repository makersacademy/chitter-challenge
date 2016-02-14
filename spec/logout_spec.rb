# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'logout' do

 scenario 'while being signed in' do
    signup
    login
    click_button 'Sign out'
    expect(page).to have_content('goodbye')
    expect(page).not_to have_content('Welcome, Welcome, Bobby')
  end

end
