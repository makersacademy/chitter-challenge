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
    expect(current_path).to eq '/users/sign-up'
    expect(find_field('email').value).to eq 'rosie@allott.com'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'email address must be valid' do
    sign_up(email: 'user@com')
    expect(User.all.size).to eq 0
    expect(current_path).to eq '/users/sign-up'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'email address must be unique' do
    sign_up
    sign_up
    expect(User.all.size).to eq 1
    expect(current_path).to eq '/users/sign-up'
    expect(page).to have_content 'Email is already taken'
  end
end
