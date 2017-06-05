require './app/models/user.rb'
require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, owliver@owlmail.com')
    expect(User.first.email).to eq('owliver@owlmail.com')
  end
end
