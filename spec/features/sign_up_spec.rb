require 'spec_helper'

feature "Sign Up", type: :feature do
  scenario "I want to sign up to Chitter" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome Courtney")
    expect(User.first.email).to eq("example@gmail.com")
  end

  scenario "I want to remain on page when my sign up details are incorrect" do
    expect{ fail_sign_up }.not_to change(User, :count)
    expect(page).to have_content("Sign Up")
  end
end

feature "Switch to log in" do
  scenario "I want to be able to access the log in page" do
    visit("/sign_up")
    expect(page.status_code).to eq 200
    click_button("Log In")

    expect(page).to have_content("Log In")
  end
end
