require 'spec_helper'
require_relative '../web-helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario "I want to sign up with email, password, name and username" do
    sign_up
    expect(page.status_code).to eq 200
    expect(page).to have_content "Maker Star"
  end

  scenario "I want to check a new account has been created in the database" do
    expect{sign_up}.to change(User, :count).by(1)
  end

  scenario "I can't login without a proper email format" do
    wrong_email_sign_up
    expect(page.current_path).to eq('/sign_up')
  end
end
