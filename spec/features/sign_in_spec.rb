require "spec_helper"
require_relative "web_helpers"

feature "log into chitter" do

  scenario "log into chitter" do
    visit '/'
    click_button 'Sign in'
    fill_in :username, with: "mariann013"
    fill_in :password, with: "Password"
    click_button 'Submit'
    expect(page).to have_content "Welcome to Chitter mariann013!"
  end
end
