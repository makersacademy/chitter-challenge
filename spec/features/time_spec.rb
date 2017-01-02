require 'spec_helper'

  feature "Time", type: :feature do
    scenario "I want my peeps to show when it was created" do

      sign_up
      log_in
      visit ("/")
      expect(page.status_code).to eq 200

      add_peep

      expect(page).to have_content ("Be somebody and no one thought you can be" && Time)
      expect(page).to have_content ("Nothing that easy is rewarding" && Time)
    end
  end
