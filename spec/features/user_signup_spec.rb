require 'spec_helper'
require 'helpers/user_helpers'

feature 'A new user wants to sign up' do
  scenario 'for the first time' do
    visit '/'
    expect(User.count).to eq 0
    expect(page).to have_content 'Welcome to Chitter'
    click_link 'Sign up'
    expect(page).to have_content 'Please fill in your details'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Registration confirmed'
    expect(User.first.email).to eq 'test@test.com'
  end

  scenario 'with an email that is already taken' do
    sign_up
    expect(User.count).to eq 1
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content 'This email is already taken'
  end

  scenario 'with a username that is already taken' do
    sign_up
    expect(User.count).to eq 1
    expect { sign_up('newperson@test.com',
                     'test123',
                     'test123',
                     'Jack',
                     'test_user1')
     }.to change(User, :count).by(0)
    expect(page).to have_content 'This username is already taken'
  end

  scenario 'with a password that does not match' do
    expect(User.count).to eq 0
    expect { sign_up('test@test.com',
                      'test',
                      'fail',
                      'John',
                      'test_user1') }.to change(User, :count).by 0
    expect(current_path).to eq '/signup'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'and will only see the confirmation message once' do
    sign_up
    expect(page).to have_content 'Registration confirmed'
    # Logins incorrectly
    login('wrong_username', 'wrong_password')
    expect(page).not_to have_content 'Registration confirmed'
  end
end