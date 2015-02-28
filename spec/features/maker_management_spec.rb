require 'spec_helper'

feature "Maker signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(Maker, :count).by(1)
    expect(page).to have_content("Welcome, loris@example.com")
    expect(Maker.first.email).to eq("loris@example.com")
  end

  def sign_up(email = "loris@example.com",
              password = "Ruby!",
              password_confirmation = "Ruby!")
    visit '/makers/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

end

