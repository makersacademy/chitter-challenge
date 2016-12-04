require 'spec_helper'
require_relative '../web-helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "User Login" do
  scenario "I want to login with my credentials" do
    sign_up
    log_in
    expect(page.current_path).to eq '/log_in'
    expect(page).to have_content 'Welcome maker'
  end
end
