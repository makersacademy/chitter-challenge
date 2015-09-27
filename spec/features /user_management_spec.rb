require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = User.new(email: "Adrian@gmail.com", username: "Adrian17", password: 'password', password_confirmation: 'password')
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Adrian@gmail.com")
    expect(User.first.email).to eq("Adrian@gmail.com")
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'requires an email to register user' do
    user = build(:user, email: nil)
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eql('/users')
  end

  scenario 'I cannot sign up with an existing email' do
    user = create :user
    sign_up(user)
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
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
