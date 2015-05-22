require 'spec_helper'

def sign_up(email = 'test@test.com',
            password = 'test123',
            password_confirmation = 'test123',
            name = 'Test Smith',
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
    expect(current_path).to eq '/signup'
    expect(User.count).to eq 1
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content 'This email is already taken'
  end

  scenario 'with a password that does not match' do
    expect(User.count).to eq 0
    visit '/signup'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test123'
    fill_in 'password_confirmation', with: 'test'
    fill_in 'name', with: 'Test Smith'
    fill_in 'username', with: 'test_user1'
    click_button 'Submit'
    expect(User.count).to eq 0
    expect(page).to have_content 'Passwords do not match'
    expect(current_path).to eq '/newuser'
  end
end