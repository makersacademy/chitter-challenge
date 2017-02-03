# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    visit '/users/new'
    expect(page).to have_content('Please create a Chitter account')
    end

    scenario 'sign up with correct details' do
      sign_up
    expect(page).to have_content "Welcome, #{user.user_name}"
        end



    scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
    end

    scenario 'I cant sign up without an email' do
      expect { sign_up(email: nil) }.not_to change(User, :count)
      expect(page).to have_content('Email must not be blank')
    end

    scenario "I can't sign up with an invalid email address" do
      expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
      expect(page).to have_content 'Email has an invalid format'
    end

    scenario 'User cannot sign up with an already registered email address' do
      sign_up
      expect {sign_up }.not_to change(User, :count)
      expect(page).to have_content('Email is already taken')
    end

    scenario 'User cannot sign up with an already registered user name' do
      sign_up
      expect {sign_up }.not_to change(User, :count)
      expect(page).to have_content('User name is already taken')
    end
end
