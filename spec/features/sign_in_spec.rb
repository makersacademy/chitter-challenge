feature 'Sign in' do
  scenario 'A user can sign in' do
    User.create(email: 'test@test.com', password: 'Password123', display_name: 'Test User', username: 'test')

    visit '/sessions/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'Password123')
    click_button('sign_in')

    expect(page).to have_content('Welcome, Test User')
  end
end