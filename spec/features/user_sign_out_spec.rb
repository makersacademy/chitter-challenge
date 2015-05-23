require 'spec_helper'
require_relative 'helpers/session_helpers'

feature 'User signs-out' do
  before(:each) do
    User.create(name: "Alex",
              username: "AlexHandy1",
              email: "ah.com",
              password: "test",
              password_confirmation: "test")
  end
  scenario 'and receives a goodbye message' do
    visit ('/')
    sign_in('ah.com', 'test')
    expect(page).to have_content("Welcome, Alex")
    click_button "Sign out"
    expect(page).to have_content("Goodbye")
  end
end


