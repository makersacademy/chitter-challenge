require 'spec_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'User signs up' do

  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, anna@klimas.com')
    expect(User.first.email).to eq('anna@klimas.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('Anna Klimas', 'ania2ab', 'anna@klimas.com', 'pass', 'wrong') }.to change(User,:count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email already exists')
  end
end