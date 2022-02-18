feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Name')
    fill_in('user_name', with: 'testusername')
    
    click_button('Sign Up!')

    expect(page).to have_content "Welcome, Test Name"
  end
end
