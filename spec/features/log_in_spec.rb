require 'spec_helper'

feature "Signing In" do
  scenario "User should be able to sign in and a welcome message be displayed" do
    create_user
    log_in_user
    expect(page).to have_content "Welcome, default"
  end
end
