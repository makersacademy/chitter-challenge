feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test_password')
    fill_in('name', with: 'testname')
    fill_in('username', with: 'test_username')
    click_button('Sign up')
    expect(page).to have_content "Welcome, test_username"
  end


end