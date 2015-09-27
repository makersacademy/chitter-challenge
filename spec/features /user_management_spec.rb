require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Adrian@gmail.com")
    expect(User.first.email).to eq("Adrian@gmail.com")
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong password') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  def sign_up(email: 'Adrian@gmail.com',
              username: 'Adrian1707',
              password: 'makers',
              password_confirmation: 'makers')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
  end

end
