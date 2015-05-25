require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do

  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Currently peeping as Andy Gout (aka Big_G)')
    expect(User.first.email).to eq('example@test.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('Big G', 'Andy Gout', 'example@test.com', 'pass', 'non_match') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up('Big G', 'Andy Gout', 'example@test.com') }.to change(User, :count).by(1)
    expect { sign_up('Robbo', 'Robert Gout', 'example@test.com') }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'with a username that is already registered' do
    expect { sign_up('Big G') }.to change(User, :count).by(1)
    expect { sign_up('Big G') }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'and has username converted to usable URL' do
    sign_up
    expect(page).to have_content('Currently peeping as Andy Gout (aka Big_G)')
  end

end

feature 'User signs in' do

  before(:each) do
    User.create(username: 'Big_G',
                name: 'Andy Gout',
                email: 'example@test.com',
                password: 'P0tat0M0nkey123!',
                password_confirmation: 'P0tat0M0nkey123!')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, Andy Gout (aka Big_G)')
    sign_in('example@test.com', 'P0tat0M0nkey123!')
    expect(page).to have_content('Currently peeping as Andy Gout (aka Big_G)')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, Andy Gout (aka Big_G)')
    sign_in('example@test.com', 'non_match')
    expect(page).not_to have_content(('Welcome, Andy Gout (aka Big_G)'))
  end

end

feature 'User signs out' do

  before(:each) do
    User.create(username: 'Big G',
                name: 'Andy Gout',
                email: 'example@test.com',
                password: 'P0tat0M0nkey123!',
                password_confirmation: 'P0tat0M0nkey123!')
  end

  scenario 'while being signed in' do
    sign_in('example@test.com', 'P0tat0M0nkey123!')
    click_button 'Sign out'
    expect(page).to have_content('Good bye!')
    expect(page).not_to have_content('Welcome, Andy Gout (aka Big G)')
  end

end