require 'spec_helper'
require_relative '../web-helper'

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature "Log out" do
  include Helpers
  scenario "I want to log out form the system" do
    sign_up
    log_in
    click_button "Log out"
    expect(page).to have_content "Bye"
  end
end
