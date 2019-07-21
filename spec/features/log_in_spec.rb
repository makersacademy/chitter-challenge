# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'log in' do
  scenario 'a user can log in' do
    User.create(email: "test@example.com", password: "password123", username: "test_user")

    visit('/sessions/new')
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "password123")
    click_button('Log in')

    expect(page).to have_content('Welcome to Chitter, test_user')
  end

  scenario 'user sees an error if username or password don\'t match' do
    User.create(email: "test@example.com", password: "password123", username: "test_user")

    visit('/sessions/new')
    fill_in('email', with: "test@example.com")
    fill_in('password', with: "wrong password")
    click_button('Log in')

    expect(page).not_to have_content('Welcome to Chitter test_user')
    expect(page).to have_content('Incorrect log in details')
  end
end
