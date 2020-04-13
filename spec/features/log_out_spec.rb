require 'peeper'

feature 'User can log out' do

  scenario 'Log out Button showing when not logged in' do
    visit '/home' 
    expect(page).to have_no_link('Log Out', href: '/logout')
    expect(page).to have_link('Log in', href: '/login')
  end

end