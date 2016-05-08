feature 'User sign out' do 
  scenario 'User can sign out' do 
    visit '/users/new'
    fill_in :name, with: 'John Smith'
    fill_in :username, with: 'johnsmith'
    fill_in :email, with: 'johnsmith@gmail.com'
    fill_in :password, with: 'banana!'
    fill_in :password_confirmation, with: 'banana!'
    click_button 'Sign up'
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end