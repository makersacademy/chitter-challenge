feature 'registration' do
  scenario 'a user can visit the sign up page from the homepage' do
    visit '/'
    click_button('Sign up')
    expect(page).to have_content "Sign up"
  end

  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Tester')
    fill_in('username', with: 'ChitterTester')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')

    expect(page).to have_content "Welcome, Tester\n@ChitterTester"
  end
end
