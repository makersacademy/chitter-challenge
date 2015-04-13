require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do

  scenario 'when a new user visits the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to blabber!
                                  Are you ready to blabb?!!!')
    expect(User.first.email).to eq('test@blabber.com')
  end

  scenario 'when a user password does not match' do
    sign_up('a@a.com', 'blah', 'blah', 'pass', 'another pass')
    expect(current_path).to eq('/users')
    expect(page).to have_content('Your passwords do not match')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end

feature 'User signs in' do

  before(:each) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct credentials' do
    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, test@test.com')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, test@test.com')
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button 'Sign out'
    expect(page).to have_content('Good bye! :(')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
