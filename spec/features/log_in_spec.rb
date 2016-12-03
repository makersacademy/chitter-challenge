require 'spec_helper'

feature "Sign in", type: :feature do

  before(:each) do
    sign_up
  end

  scenario "I would like to be able to sign in" do
    log_in
    expect(page.status_code).to eq 200
    expect(page).to have_content ("Peep Board")
  end

  scenario "I would like to stay on page if log in details are incorrect" do
    expect{ fail_log_in }.not_to change(User, :count)
    expect(page.status_code).to eq 200
    expect(page).to have_content("Log In")
  end
end
