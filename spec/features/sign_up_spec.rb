require 'spec_helper'
require_relative '../../lib/user'

feature 'User signs up' do

  scenario 'during first visit to website' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, ilya.faybisovich@gmail.com'
    expect(User.first.username).to eq 'ilyafaybisovich'
  end

  scenario 'with passwords that do not match' do
    expect { sign_up('a@a.com', 'aaa', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end
  
  def sign_up(
    email = "ilya.faybisovich@gmail.com",
    username = "ilyafaybisovich",
    password = 'applecoder',
    password_confirmation = 'applecoder')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end