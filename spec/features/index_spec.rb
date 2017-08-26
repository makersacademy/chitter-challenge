require_relative "../../app/app"
require 'spec_helper'

RSpec.feature "Index page" do
  scenario "Check if there are fields to fill" do
    visit "/"
    fill_in("user", with: "Panda")
    fill_in("text", with: "This is the first post ever on Chitter.")
    expect(page.status_code).to eq 200
    expect(page).to have_field("user")
    expect(page).to have_field("text")
  end
end
