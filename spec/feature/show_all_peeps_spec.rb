require "pg"
require 'uri'

feature "Seeing peeps in date order" do
  scenario "Seeing peeps in date order" do
    sign_up
    fill_in("peep", with: "just setting up my chittr")
    click_button("Peep")
    fill_in("peep", with: "this is the second one")
    click_button("Peep")

    expect(first(".peep")).to have_content "this is the second one"
    expect(first(".peep")).to_not have_content "just setting up my chittr"
  end
end
