require_relative './web_helpers.rb'

feature 'Signing up' do
  scenario 'User can sign up for Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter chewbacca'
  end
  scenario 'User gets an error message if username is already taken' do
    duplicate_sign_up_username
    expect(page).to have_content 'Sorry that username or email is already taken. Please try again.'
  end
  scenario 'User gets an error message if email is already taken' do
    duplicate_sign_up_email
    expect(page).to have_content 'Sorry that username or email is already taken. Please try again.'
  end
end

feature 'Logging in' do
  scenario 'An existing user can log in' do
    log_in
    expect(page).to have_content 'Logged in as @hansolo'
  end
  scenario 'A user is prompted if their email is invalid' do
    log_in_incorrect_email
    expect(page).to have_content 'That email or password is incorrect. Please try again.'
  end
  scenario 'A user is prompted if their password is invalid' do
    log_in_incorrect_password
    expect(page).to have_content 'That email or password is incorrect. Please try again.'
  end
end

feature 'Signing out' do
  scenario 'A logged in user can sign out' do
    log_in
    click_button 'Log Out'
    expect(page).to have_content 'You have successfully logged out. Come back soon.'
  end
end

feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    sign_up
    post_peep
    expect(page).to have_content 'A test peep!'
  end
end
