require 'peeper'

feature 'User can log out' do

  scenario 'Log out Button showing when not logged in' do
    visit '/home' 
    expect(page).not_to have_button 'logout'
    expect(page).to have_button 'Login'
  end

end