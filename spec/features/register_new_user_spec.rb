feature 'register a new user' do
  scenario 'new user fills in registration form correctly' do
    visit '/'
    click_button 'Sign Up'
    fill_in :email, with: 'example@test.com'
    fill_in :password, with: 'password123'
    fill_in :name, with: 'Test_Name'
    fill_in :username, with: 'Test_Username'
    click_button 'Sign Up'
    expect(page).to have_content 'Welcome, Test_Name'
  end
end
