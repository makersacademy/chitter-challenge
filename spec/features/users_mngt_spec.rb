require 'spec_helper'

feature 'Feature - Users signing up' do
  scenario 'sign up as a brand new user' do
    sign_up
    expect(User.all.size).to eq 1
    expect(current_path).to eq '/'
  end

  scenario 'password and confirmation must match' do
    sign_up(password_confirmation: 'not_my_password')
    expect(User.all.size).to eq 0
    expect(current_path).to eq '/users/new'
    expect(find_field('email').value).to eq 'rosie@allott.com'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email address must be valid' do
    sign_up(email: 'user@com')
    expect(User.all.size).to eq 0
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'email and username must be unique' do
    sign_up
    sign_up
    expect(User.all.size).to eq 1
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email is already taken'
    expect(page).to have_content 'Username is already taken'
  end
end

feature 'Feature - Users logging in' do
  scenario 'can log in with correct credentials' do
    sign_up
    sign_up(email: 'test@test.com', name: 'test', username: 'test')
    sign_in
    expect(current_path).to eq '/'
    expect(page).to have_content("Welcome, Ral")
  end

  scenario 'cannot log in with incorrect credentials' do
    sign_up
    sign_in(password: 'not_my_password')
    expect(page).to have_content 'Email or password incorrect'
  end
end
