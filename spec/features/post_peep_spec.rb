require 'spec_helper'
require 'web_helper'

feature "Posting a peep", type: :feature do

  before(:each) do
    visit('/')
  end

  scenario "I want to be able to post a peep" do

    sign_up
    log_in
    expect(page.status_code).to eq 200
    expect{ add_peep }.to change(Peep, :count).by(2)
    within 'ul#peeps' do
    expect(page).to have_content("Be somebody and no one thought you can be")
    expect(page).to have_content("Nothing that easy is rewarding")
    end
  end

  scenario "I should not be allowed to post a peep when I am not logged in" do

    def failed_peep
      click_button("Add Peep")
    end

    expect(page.status_code).to eq 200
    expect{ failed_peep }.to_not change(Peep, :count)
    expect(page).to have_content("Log In")
  end

  scenario "I want to be able to access the sign up page" do
    click_button("Sign Up")

    expect(page).to have_content("Sign Up")
  end

  scenario "I want to be able to access the log in page" do
    click_button("Log In")

    expect(page).to have_content("Log In")
  end
end
