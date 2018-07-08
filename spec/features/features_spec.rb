require_relative './web_helpers.rb'

feature 'Signing up' do
  scenario 'User can sign up for Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter JaneDoe'
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
    visit '/'
    click_button 'Log In'
    fill_in :email, with: 'hansolo@gmail.com'
    fill_in :password, with: 'pa$$w0rd1'
    click_button 'Log In'
    expect(page).to have_content 'Logged in as @hansolo'
  end
  scenario 'A user is prompted if their email is invalid' do
    visit '/'
    click_button 'Log In'
    fill_in :email, with: 'incorrect email'
    fill_in :password, with: 'pa$$w0rd1'
    click_button 'Log In'
    expect(page).to have_content 'That email or password is incorrect. Please try again.'
  end
  scenario 'A user is prompted if their password is invalid' do
    visit '/'
    click_button 'Log In'
    fill_in :email, with: 'hansolo@gmail.com'
    fill_in :password, with: 'incorrect password'
    click_button 'Log In'
    expect(page).to have_content 'That email or password is incorrect. Please try again.'
  end
end


feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    sign_up
    fill_in :peep_input, with: 'A test peep!'
    click_button 'Post Peep'
    expect(page).to have_content 'A test peep!'
  end
end
