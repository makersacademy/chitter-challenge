feature 'sign out' do
  scenario 'a user can sign out' do
    User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    visit '/sessions/new'

    fill_in 'email', with: 'mock@gmail.com'
    fill_in 'password', with: 'psw123'
    click_button 'Sign In'
    click_button 'Sign Out'

    expect(page).not_to have_content 'Welcome uValente!'
  end
end
