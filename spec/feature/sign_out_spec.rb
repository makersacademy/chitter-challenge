feature 'User logs out' do
  scenario 'signing out ' do
    visit'/sign_up'
    fill_in 'first_name', with: 'John'
    fill_in 'last_name', with: 'Smith'
    fill_in 'user_name', with: 'John'
    fill_in 'email', with: 'john.smith@yahoo.co.uk'
    fill_in 'password', with: 'cherry5'
    click_button 'Sign up'
    visit '/login'
    fill_in 'user_name', with: 'John'
    fill_in 'password', with: 'cherry5'
    click_button 'login'
    click_button 'Log out'
    expect(page.current_path).to eq('/')
  end
  end
