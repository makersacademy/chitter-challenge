require 'spec_helper'
require_relative '../web-helper'
require_relative '../../app/app.rb'
require_relative '../../app/models/user.rb'


# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario "I want to sign up with email, password, name and username" do
    sign_up
    expect(page).to have_content "Maker Star"
  end

  scenario "I want to check a new account has been created in the database" do
    expect{new_sign_up}.to change(User, :count).by(1)
  end

end
