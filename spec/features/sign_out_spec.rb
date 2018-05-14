feature 'sign out' do
  scenario 'user can sign out from the chitter' do
    visit('/')
    fill_in 'name', with: 'Jon'
    fill_in 'username', with: 'jonny'
    fill_in 'email', with: 'jonny@gmail.com'
    fill_in 'password', with: 'pass123'
    click_button 'Sign up'
    click_button 'Sign out'
  end
end
