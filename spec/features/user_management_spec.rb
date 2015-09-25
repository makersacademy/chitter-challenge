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

  context 'Successful attempt Sign up' do
    scenario 'registered user can see a posts page' do
      user = build :user
      sign_up(user)
      expect(page).to have_content user.name
      expect(User.count).to eq 1
      expect(current_path).to eq '/posts/new'
    end
  end

  context 'Unsuccesful attempts during Sign Up' do
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

    scenario 'when passwords do not match - NOT WORKING' do
      user = build(:user, password_confirmation: 'wrong')
      sign_up(user)
      #expect(current_path).to eq 'users/new'
      #expect(page).to have_content 'Password does not match the confirmation'
      expect(User.count).to eq 0
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

  context 'During Sign in' do
    scenario 'Successful: password and email entered correctly' do
      user = build(:user)
      sign_up(user)
      sign_in(user)
      expect(page).to have_content user.name
      expect(current_path).to eq '/posts'
    end

    scenario 'Unsuccesful: password entered incorrectly' do
      authorized_user = build(:user)
      sign_up(authorized_user)
      authorized_user.password =  'wrong'
      sign_in(authorized_user)
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content 'Password and/or email incorrect'
    end
  end
    scenario 'user can Sign Out' do
      user = build(:user)
      sign_up(user)
      sign_in(user)
      click_button 'Sign Out'
      expect(current_path).to eq '/sessions'
      expect(page).to have_content 'goodbye'
  end


end


