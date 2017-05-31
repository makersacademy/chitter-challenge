require './app/app.rb'
require 'spec_helper'
require 'web_helper'

feature 'Sign up' do
  scenario 'I want to sign up for Chitter' do
    # visit '/users/new'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, eren@makersacademy.com')
    expect(User.first.email).to eq('eren@makersacademy.com')
  end
end

feature 'Log in' do
  scenario 'I want to log in to Chitter' do
    visit '/index'
    fill_in 'user name', with: 'kyojin'
    fill_in 'password', with: 'password'
    click_button 'Log in'
  end
end
