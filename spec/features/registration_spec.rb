require "spec_helper.rb"
require "./spec/features/web_helpers.rb"

feature "registering as a new user" do

  scenario "clicking the register button" do
    visit '/'
    click_button 'Register'
    expect(page).to have_content 'Register here'
  end

  # scenairo "register new account" do
  #   sign_up
  #   expect(page).to have_content 'Chitter homepage'
  # end
end
