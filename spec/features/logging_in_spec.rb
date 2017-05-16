feature 'Logging in to an account' do
  # You can dry up a lot of these tests
  # You can probably extract this method to a helper file, but to demonstrate
  def log_in_with(email:, password:)
    signs_in_successfully
    visit '/login'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Submit'
  end

  scenario 'User can log in' do
    log_in_with(email: 'example@email.com', password: 'password')
    expect(page).to have_content 'Welcome to Chitter, Jack Dorsey'
  end

  scenario 'Login fails if email does not exist' do
    log_in_with(email: 'example@nonexistent.com', password: 'password')
    expect(page).to have_current_path('/login')
    expect(page).to have_content 'Invalid login details'
  end

  scenario 'Login fails if password is incorrect' do
    log_in_with(email: 'example@email.com', password: 'P455W0RD')
    expect(page).to have_current_path('/login')
    expect(page).to have_content 'Invalid login details'
  end
end
