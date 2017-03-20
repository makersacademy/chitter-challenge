require 'spec_helper'

feature "Sign Out", type: :feature do
  scenario "I want to be able to sign out" do
    sign_up
    log_in
    expect(page.status_code).to eq 200

    click_button("Log Out")
  end
end
