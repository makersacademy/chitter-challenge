feature 'Logging in to an account' do
  scenario 'User can log in' do
    signs_in_successfully
    visit '/login'
    fill_in :email, with: 'example@email.com'
    fill_in :password, with: 'password'
    click_button 'Submit'
    expect(page).to have_content 'Welcome to Chitter, Jack Dorsey'
  end

  scenario 'Login fails if email does not exist' do
    signs_in_successfully
    visit '/login'
    fill_in :email, with: 'email@nonexistent.com'
    fill_in :password, with: 'password'
    click_button 'Submit'
    expect(page).to have_current_path('/login')
    expect(page).to have_content 'Invalid login details'
  end
end
