require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do
  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome Bob!')
    expect(User.first.email).to eq('bob@email.com')
  end

  scenario 'with a password that doesn\'t match' do
    expect { sign_up(password: "psw",
                     confirmation: "wrong") }.to change(User, :count).by 0
    expect(page).to have_content('Password doesn\'t match')
  end

  scenario 'with a username that already exists' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up(username: "bob89") }.to change(User, :count).by 0
    expect(page).to have_content('Username is already registered')
  end

  scenario 'with an invalid email address' do
    expect { sign_up(email: "bobmail") }.to change(User, :count).by 0
    expect(page).to have_content('You have to insert a valid email address')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up(username: "john89",
                     email: "bob@email.com") }.to change(User, :count).by 0
    expect(page).to have_content('Email is already registered')
  end

  scenario 'leaving the username field empty' do
    expect { sign_up(username: "") }.to change(User, :count).by 0
    expect(page).to have_content('You need a username')
  end

  scenario 'leaving the name field empty' do
    expect { sign_up(name: "") }.to change(User, :count).by 0
    expect(page).to have_content('We need your name')
  end

  scenario 'leaving the email field empty' do
    expect { sign_up(email: "") }.to change(User, :count).by 0
    expect(page).to have_content('We need your email')
  end
end

feature 'User signs in' do
  before do
    User.create(username: "bob89",
                name: "Bob",
                email: "bob@email.com",
                password: "password",
                password_confirmation: "password")
  end
  scenario 'with correct credentials' do
    log_in("bob89", "password")
    expect(page).to have_content("Welcome Bob!")
  end

  scenario 'with incorrect credentials' do
    log_in("super_bob", "password")
    expect(page).to have_content("Username or password are incorrect")
  end
end

feature 'User sign out' do
  before do
    User.create(username: "bob89",
                name: "Bob",
                email: "bob@email.com",
                password: "password",
                password_confirmation: "password")
  end
  scenario 'while signed in' do
    log_in("bob89", "password")
    click_button "Log out"
    expect(page).to have_content "Log in"
  end
end

feature 'User that has lost his password' do
  before do
    User.create(username: "bob89",
                name: "Bob",
                email: "bob@email.com",
                password: "password",
                password_confirmation: "password")
  end
  scenario 'he wants to reset it' do
    reset_password_form("bob@email.com")
    token = User.first.password_token
    visit "/reset_password/#{token}"
    old_password = User.first.password_digest
    change_password_form('new_password', 'new_password')
    expect(User.first.password_digest).not_to eq old_password
    expect(User.first.password_token).to be_nil
  end

  scenario 'he wants to reset it but he puts wrong password confirmation' do
    reset_password_form("bob@email.com")
    token = User.first.password_token
    visit "/reset_password/#{token}"
    change_password_form('new_password', 'new_wrong_password')
    expect(page).to have_content("Password doesn't match")
  end

  scenario 'he cannot reset if the token is older than one hour' do
    user = User.first
    user.password_token = "abcd"
    user.password_token_timestamp = Time.new(2015, 4, 9, 12, 0, 0)
    user.save
    visit "/reset_password/#{user.password_token}"
    expect(page).to have_content('Token time has expired!')
  end
end