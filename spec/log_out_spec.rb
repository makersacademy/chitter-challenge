# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'Log out' do
  scenario 'a user can log out' do
    User.create(email: "test@example.com", password: "password123", username: "test_user")
    visit('/sessions/new')
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "password123")
    click_button('Log in')

    click_button('Log out')
    expect(page).not_to have_content('Welcome to Chitter test_user')
    expect(page).to have_content('You have signed out')
  end
end
