require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = User.create(email: "Adrian@gmail.com", username: "Adrian17", password: 'password', password_confirmation: 'password')
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Adrian@gmail.com")
    expect(User.first.email).to eq("Adrian@gmail.com")
  end

  scenario 'requires a matching confirmation password' do
    user = User.create(email: "Adrian17@gmail.com", username: "Adrian17", password: 'password', password_confirmation: 'wrong')
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'requires an email to register user' do
    user = User.create(email: nil, username: "Adrian17", password: 'password', password_confirmation: 'password')
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eql('/users')
  end

  def sign_up(user)
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: user.email
  fill_in :username, with: user.username
  fill_in :password, with: user.password
  fill_in :password_confirmation, with: user.password_confirmation
  click_button 'Sign up'
  end

end
