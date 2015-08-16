require 'helpers/session.rb'
#include SesssionHelpers
require 'spec_helper'

feature 'user registration' do
  scenario 'see a Sign up page' do
    visit '/users/new'
    expect(page).to have_content 'Sign up'
  end

  scenario 'there are no users in database at start of testing' do
    expect(User.count).to eq 0
  end

  context 'Successful Sign up' do
    scenario 'registered user can see a posts page' do
      user = build :user
      sign_up(user)
      expect(page).to have_content user.name
      expect(User.count).to eq 1
      expect(current_path).to eq '/posts/new'
    end
  end

  context 'no action is taken for incorrect input in Sign Up' do
    scenario 'when email is missing' do
      user = build(:user, email: '')
      sign_up(user)
      expect(current_path).to eq '/users/new'
      expect(page).not_to have_content "#{user.name}"
      expect(User.count).to eq 0
    end

    scenario 'when username is missing' do
      user = build(:user, username: '')
      sign_up(user)
      expect(current_path).to eq '/users/new'
      expect(page).not_to have_content "#{user.name}"
      expect(User.count).to eq 0
     end

    scenario 'when name is missing' do
      user = build(:user, name: '')
      sign_up(user)
      expect(current_path).to eq '/users/new'
      expect(User.count).to eq 0
     end

    scenario 'when passwords do not match' do
      user = build(:user, password_confirmation: 'wrong')
      sign_up(user)
      #expect(current_path).to eq 'users/new'
      #expect(page).to have_content 'Passwords do not match, please reenter'
      #expect(User.count).to eq 0
     end

    scenario 'when email exists already' do
      user = build(:user)
      sign_up(user)
      expect { sign_up(user) }.to_not change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Email is already taken'
      expect(User.first.email).to eq user.email
    end

    scenario 'when username exists already' do
      user_one = build(:user)
      sign_up(user_one)
      user_two = build(:user, email: 'different@d.com', username: user_one.username)

      expect { sign_up(user_two) }.to_not change(User, :count)
      expect(current_path).to eq '/users'
      expect(page).to have_content 'Username is already taken'
      expect(User.first.username).to eq user_two.username
     end

   end


#   have_content "Welcome to Chitter, diegoregules@gmail.com"
end


