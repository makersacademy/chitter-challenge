require 'spec_helper'
require 'web_helper'

feature "Sign Up", type: :feature do
  scenario "I want to sign up to Chitter" do
    visit "/sign_up"
    expect(page.status_code).to eq 200

    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome Courtney")
    expect(User.first.email).to eq("example@gmail.com")
  end
end
