require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'user can sign up' do
  scenario 'when user visiting for first time' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, Iciar')
    expect(User.first.email).to eq 'iciar@icicleta.com'
  end

  scenario 'when using an email already used' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.to change(User, :count).by 0
    expect(page).to have_content 'This email address has been already taken'
  end

  scenario 'when using an username already taken' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.to change(User, :count).by 0
    expect(page).to have_content 'This username has been already taken'
  end

  scenario "when password confirmation doesn't match" do
    expect { sign_up 'Iciar', 'Icicleta', 'iciar@icicleta.com', 'pass', 'wrong' }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content('Sorry, your passwords do not match')
  end
end

feature 'user can sign in' do
  before(:each) do
  User.create(username:              'Icicleta',
              password:              'holaCaracola',
              password_confirmation: 'holaCaracola')
  end

  scenario 'when signing in with right details' do
    visit '/'
    expect(page).not_to have_content 'Welcome, Iciar'
    sign_in 'Icicleta', 'holaCaracola'
    expect(page).to have_content 'Welcome, Iciar'
  end

  scenario 'when signing in with wrong details' do
    visit '/'
    expect(page).not_to have_content 'Welcome, Iciar'
    sign_in 'Icicleta', 'wrong'
    expect(page).not_to have_content 'Welcome, Iciar'
  end

end

feature 'user can sign out' do
  before(:each) do
  User.create(username:              'Icicleta',
              password:              'holaCaracola',
              password_confirmation: 'holaCaracola')
  end

  scenario 'when signing out' do
    sign_in 'Icicleta', 'holaCaracola'
    click_button 'Sign Out'
    expec(page).to have_content 'Good Bye!'
    expec(page).not_to have_content 'Welcome, Iciar'
  end

end
