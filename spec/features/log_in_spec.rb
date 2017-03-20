require 'spec_helper'

feature "Log in", type: :feature do

  before(:each) do
    sign_up
    visit('/session/new')
  end

  scenario "I would like to be able to sign in" do
    expect(page.status_code).to eq 200

    log_in
    expect(page).to have_content ("Peep Board")
  end

  scenario "I would like to stay on page if log in details are incorrect" do
    expect{ fail_log_in }.not_to change(User, :count)
    expect(page.status_code).to eq 200
    expect(page).to have_content("Log In")
    expect(page.current_path).to eq('/session/new')
  end
end

feature 'Switch to sign up' do
  scenario "I would like to be able to access the sign up page" do
    visit ('/session/new')
    click_button("Sign Up")

    expect(page).to have_content("Sign Up")
  end
end
