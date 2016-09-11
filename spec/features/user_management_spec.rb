require 'spec_helper'
require './app/models/user'

feature 'User sign up' do

  subject(:user) { described_class.new }

  scenario 'I can sign up as a new user' do
    expect { sign_up }. to change(User, :count).by(1)
    expect(page).to have_content('Welcome, awild@gmail.com')
    expect(User.first.email).to eq('awild@gmail.com')
  end

  scenario 'requires matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cant sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'i cant sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'i cannot sign up with existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end


end
