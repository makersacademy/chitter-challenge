require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

feature 'signing in' do
  scenario 'signing up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, Ed')
    expect(User.first.user_name).to eq('Ed')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('a', 'a@a.com', 'p', 'w') }.to change(User, :count).by 0
    expect(current_path).to eq('/user')
    expect(page).to have_content('Sorry, your password
                                 does not match the confirmation')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This Email is already taken')
  end

  scenario 'with an username that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This Username is already taken')
  end

end

feature 'User signs in' do

  before(:each) do
    User.create(user_name: 'Ed', email: 'ed@ed.com',
                password: '123', password_confirmation: '123')
  end

  scenario 'with the right information' do
    visit '/'
    expect(page).not_to have_content('welcome, Ed')
    sign_in('Ed', '123')
    expect(page).to have_content('Welcome, Ed')
  end

  scenario 'with wrong information' do
    visit '/'
    expect(page).not_to have_content('Welcome, Ed')
    sign_in('Ed', '321')
    expect(page).not_to have_content('Welcome, Ed')
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(user_name: 'Ed', email: 'ed@ed.com',
                password: '123', password_confirmation: '123')
  end

  scenario 'while being signed in' do
    sign_in('Ed', '123')
    click_button 'Sign out'
    expect(page).to have_content('Good Bye!')
    expect(page).not_to have_content('Welcome, Ed')
  end

end
