feature 'Log-out' do
  scenario 'a signed-up user can log out of the website' do
    user = User.create(username: 'testname', password: 'password123')
    visit '/users/login'
    fill_in('username', with: 'testname')
    fill_in('password', with: 'password123') 
    click_button 'Log In'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, testname'

    click_button 'Log Out'

    expect(current_path).to eq '/'
    expect(page).to have_content 'No one signed in, please log in or sign up.'
    expect(page).not_to have_content 'testname Signed In'
  end
end