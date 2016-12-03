require 'spec_helper'

feature "Posting a peep", type: :feature do
  scenario "I want to beable to post a peep" do
    visit ("/new_peep")
    expect(page.status_code).to eq 200

    fill_in("peep", with: "Coding is fun")
    click_button("Post")

    expect(page).to have_content "Coding is fun"
    # expect(User.first.name).to eq "Courtney"
  end
end
