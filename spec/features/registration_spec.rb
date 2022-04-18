feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in("name", with: 'John Doe')
    fill_in("username", with: 'JD99')
    fill_in("email", with: 'JDoe99@example.com')
    fill_in("password", with: 'Password123')
    click_button('Sign up')
    expect(page).to have_content "Welcome, JD99!"
  end
end
