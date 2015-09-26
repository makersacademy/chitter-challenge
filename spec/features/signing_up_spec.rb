require 'spec_helper'

feature 'Signing up' do

  scenario 'can sign up a new user' do
    user = build(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter!')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'requires entering an email' do
    user = build(:user, email: '')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'requires entering an username' do
    user = build(:user, username: '')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'I cannot sign up with an existing email' do
    user = build(:user)
    sign_up user
    diff_user = build(:user, email: 'alice@example.com')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    user = build(:user)
    sign_up user
    diff_user = build(:user, username: 'alice123')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

end
