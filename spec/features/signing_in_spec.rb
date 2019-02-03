feature 'Signing in' do
  scenario 'Sign in is sucessful when the user enters a correct username and password' do
    register_user
    visit '/'
    click_button 'Sign in'
    fill_in 'username', with: 'testuser'
    fill_in 'password', with: 'Password123'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome to Chitter, Test User'
  end

  scenario 'Sign in is unsucessful when the user enters an incorrect usernames' do
    register_user
    visit '/'
    click_button 'Sign in'
    fill_in 'username', with: 'fakeuser'
    fill_in 'password', with: 'Password123'
    click_button 'Sign in'
    expect(page).to_not have_content 'Welcome to Chitter, Test User'
    expect(page).to have_content 'Invalid username or password entered. Please try again.'
  end
end
