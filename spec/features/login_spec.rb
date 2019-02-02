# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'users can log into Chitter' do

  scenario 'the login process should work' do
    create_user
    valid_login
    expect(page).to have_content 'Welcome, Ivan. You are logged in.'
  end

  scenario 'a user with incorrect password is not logged in' do
    create_user
    login_wrong_password
    expect(page).to_not have_content 'Welcome, Ivan. You are logged in.'
    expect(page).to have_button 'Login'
  end

  scenario 'a user with incorrect username is not logged in' do
    create_user
    login_wrong_username
    expect(page).to_not have_content 'Welcome, Ivan. You are logged in.'
    expect(page).to have_button 'Login'
  end

  scenario 'the posts should show their owner' do
    create_user
    valid_login
    post_one_message
    expect(page).to have_content 'by Ivan'
  end

end