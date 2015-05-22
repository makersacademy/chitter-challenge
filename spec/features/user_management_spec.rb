require 'spec_helper'

def sign_up(email = 'test@test.com',
            password = 'test123',
            password_confirmation = 'test123',
            name = 'John Smith',
            username = 'test_user1')
  visit '/signup'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'name', with: name
  fill_in 'username', with: username
  click_button 'Submit'
end

feature 'A new user wants to sign up' do
  scenario 'for the first time' do
    visit '/'
    expect(User.count).to eq 0
    expect(page).to have_content 'Welcome to Chitter'
    click_link 'Sign up'
    expect(page).to have_content 'Please enter your details'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome test@test.com!'
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
                      'test123,
                      test123,
                      John Jones
                      test_user1')
     }.to change(User, :count).by(0)
    expect(page).to have_content 'This username is already taken'
  end

  scenario 'with a password that does not match' do
    expect(User.count).to eq 0
    expect { sign_up('test@test.com',
                      'test',
                      'fail',
                      'John Smith',
                      'test_user1') }.to change(User, :count).by 0
    expect(current_path).to eq '/signup'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end