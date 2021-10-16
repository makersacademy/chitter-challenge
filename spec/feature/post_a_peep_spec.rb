require "pg"
require 'uri'

feature "Posting a peep" do
  scenario "Filling in a peep and posting it" do
    visit("/home")
    fill_in("peep", with: "just setting up my chittr")
    click_button("Peep")

    expect(page).to have_content ("just setting up my chittr")
  end
end