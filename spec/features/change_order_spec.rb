require 'spec_helper'

feature "Change peep order", type: :feature do

  before(:each) do
    sign_up
    log_in
    visit ("/")
    expect(page.status_code).to eq 200
    click_button("Add Peep")
    fill_in("peep", with: "Nothing that easy is rewarding")
    click_button("Post")
    click_button("Add Peep")
    fill_in("peep", with: "Be somebody and no one thought you can be")
    click_button("Post")
  end

  scenario "I want to see my peeps in reverse chronological order" do
    click_button("Oldest First")

    within 'ul#peeps' do
      expect(page).to have_content("Be somebody and no one thought you can be")
      expect(page).to have_content("Nothing that easy is rewarding")
    end
  end

    scenario "I want to be able to go back to the orginal order" do
      click_button("Newest First")

      within 'ul#peeps' do
        page.body
        expect(page).to have_content("Nothing that easy is rewarding")
        expect(page).to have_content("Be somebody and no one thought you can be")
      end
    end
end
