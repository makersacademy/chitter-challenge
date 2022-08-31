feature 'Log-in' do
  scenario 'a signed-up user can log in to the website' do
    user = User.create(username: 'testname', password: 'password123')
    visit '/users/login'
    fill_in('username', with: 'testname')
    fill_in('password', with: 'password123') 
    click_button 'Log In'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, testname'
  end

  scenario 'a user who is not signed up cannot log in to the website' do
    visit '/users/login'
    fill_in('username', with: 'testname')
    fill_in('password', with: 'password123') 
    click_button 'Log In'

    expect(current_path).to eq '/login'
  end
end