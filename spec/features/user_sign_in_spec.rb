require 'spec_helper'
require_relative 'helpers/session_helpers'

feature 'User signs-in' do
  before(:each) do
    User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "test",
              password_confirmation: "test") #how do you test password_digest creation?
  end

  scenario 'and as an existing user I can log-in' do
    visit ('/')
    expect(page).not_to have_content("Welcome, Alex")
    sign_in("ah.com", "test")
    expect(page).to have_content("Welcome, Alex")
  end

  scenario 'without or with the wrong credentials I cannot log-in' do
    visit ('/')
    expect(page).not_to have_content("Welcome, Alex")
    sign_in("ah.com", "wrong")
    expect(page).not_to have_content("Welcome, Alex")
  end
end