feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_button('Sign Up')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'testusername')
    fill_in('name', with: 'testname')
    click_button('Submit')

    expect(page).to have_content "Welcome, testname"
  end
end
