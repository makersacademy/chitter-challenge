require 'spec_helper'
require 'web_helpers'

feature "making peep" do
  scenario "returns peep on page if logged in" do
    sign_up
    fill_in("text", with: "Hello Chitter!")
    click_button "Peep"
    expect(Peep.first.text).to eq "Hello Chitter!"
    expect(page).to have_content("Hello Chitter!")
    expect(page).to have_content(Peep.first.created_at.asctime)
  end
    scenario "doesn't let you peep if logged out" do
      visit '/peep'
      expect(page).not_to have_field("text")
      expect(page).not_to have_button("Peep")
    end
end
