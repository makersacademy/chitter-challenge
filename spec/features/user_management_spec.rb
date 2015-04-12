require 'spec_helper'

feature 'User can sign up' do
  scenario 'when they are new to the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello George,')
  end

  scenario 'there is a list of all users' do
    sign_up
    sign_out
    sign_up('Ryan', 'me@ryan.com', 'bat')
    visit '/users/all'
    expect(page).to have_content('cat')
    expect(page).to have_content('bat')
  end

  scenario 'once signed up, their username is displayed on every page' do
    sign_up
    visit '/'
    expect(page).to have_content 'cat'
  end

  # This could be done better using flash or something, but fine for now
  scenario 'error will be raised when their email is already registered' do
    sign_up
    sign_out
    sign_up
    expect(page).to have_content('That username or email is already taken')
  end

  scenario 'error will be raised when their username is already registered' do
    sign_up(name = 'George', email = 'me@blah.com',
            username = 'cat', password = '12345')
    sign_out
    sign_up(name = 'George', email = 'me@georgemcgowan.com',
            username = 'cat', password = '12345')
    expect(page).to have_content('That username or email is already taken')
  end

  xscenario 'error will be raised when their username is already registered' do
  end
end

feature 'User can log out' do
  scenario 'user signs up and then logs out' do
    sign_up
    visit '/'
    click_button('Log Out')
    expect(page).not_to have_content('cat')
  end

  scenario 'user who did not log in cannot see log out button' do
    visit '/'
    expect do
      click_button('Log Out')
    end.to raise_error 'Unable to find button "Log Out"'
  end

  scenario 'previously signed up user can log out' do
    sign_up
    sign_out
    log_in
    sign_out
    expect(page).not_to have_content('cat')
  end
end

feature 'Users can log in' do

  scenario 'user logs in with correct details' do
    sign_up
    sign_out
    log_in
    expect(page).to have_content('cat')
  end

  scenario 'error someone logs in with the wrong details' do
    sign_up
    sign_out
    log_in('dog', 'blah')
    expect(page).to have_content('Invalid username or password')
  end

end

def log_in(username = 'cat', password = '12345')
  visit '/'
  fill_in('Login_username', with: username)
  fill_in('Login_password', with: password)
  click_button('Log In')
end

def sign_up(name = 'George', email = 'me@georgemcgowan.com',
            username = 'cat', password = '12345')
  visit '/'
  fill_in('Name', with: name)
  fill_in('Email', with: email)
  fill_in('Username', with: username)
  fill_in('Password', with: password)
  click_button('Sign Up')
end

def sign_out
  visit('/')
  click_button('Log Out')
end
