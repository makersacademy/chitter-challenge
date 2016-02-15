require 'spec_helper'
require 'web_helpers'
require './app/chitter.rb'

feature 'Sigin up' do

  before do
    sign_up
  end

  scenario 'I can sign up as a new user' do
    expect(current_path).to eq '/'
    expect(page).to have_content('Welcome, Rachel')
  end

  scenario 'I cannot sign up if my user name is the same as one that already exists' do
    sign_up_dup_username
    expect(current_path).to eq '/users'
    expect(page).to have_content('Username is already taken')
  end

  scenario 'I cannot sign up with an email address that already exists' do
    sign_up_dup_email
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up if my passwords dont match' do
    sign_up_pw_not_matching
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end
end
