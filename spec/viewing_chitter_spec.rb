require "spec_helper"
require_relative "web_helpers"

feature "Chitter homepage" do

  scenario "Chitter welcomes user" do
    sign_up
    expect(page).to have_content('Welcome, mariann013')
    expect(User.first.username).to eq('mariann013')
  end
end
