require 'spec_helper'

feature 'signing up' do
  scenario 'I would like to sign up as a chitter user' do
    sign_up
    expect(User.first.username).to eq('Daisy123')
    expect(page).to have_content 'Welcome, Daisy123!'
  end

  scenario 'password mismatch' do
    expect{ sign_up(password: 'right', password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'username is nil' do
    expect{ sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'first name is nil' do
    expect{ sign_up(first_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'First name must not be blank'
  end

  scenario 'last name is nil' do
    expect{ sign_up(last_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Last name must not be blank'
  end

  scenario 'email is nil' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'I can\'t sign up with and invalid email address' do
    expect { sign_up(email: 'invalid.com') }.to change(User, :count).by(0)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'I cannot sign up using an existing username' do
    sign_up(email: 'bob@bobross.com')
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'I cannot sign up using an existing email address' do
    sign_up(username: 'TheDogs')
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
