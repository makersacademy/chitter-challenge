require 'spec_helper'

feature "post peep" do

  scenario "post a new peep from homepage" do
    sign_up
    peep("Testing, testing, testing!")
    expect(page).to have_content("Testing, testing, testing!")
  end

  scenario "can't post if not logged in" do
    peep("Buuhuu")
    expect(page).not_to have_content("Buuhuu")
  end
end
