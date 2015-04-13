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

feature 'Users lost his password' do
  before(:each) do
    User.create(user_name: 'Ed',
                email: 'ed@ed.com',
                password: '123',
                password_confirmation: '123')
  end

  scenario 'he wants to reset it' do
    reset_form('ed@ed.com')
    token = User.first.password_token
    visit "/reset_password/#{token}"
    old_password = User.first.password_digest
    change_form('new_password', 'new_password')
    expect(User.first.password_digest).not_to eq old_password
    expect(User.first.password_token).to be_nil
  end

  scenario 'he wants to reset it but he puts wrong password confirmation' do
    reset_form('ed@ed.com')
    token = User.first.password_token
    visit "/reset_password/#{token}"
    change_form('new_password', 'new_wrong_password')
    expect(page).to have_content('Sorry, your password does
                                  not match the confirmation')
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
