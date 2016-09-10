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
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
