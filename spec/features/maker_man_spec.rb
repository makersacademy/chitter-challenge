require 'spec_helper'

feature "Maker signs up" do

  scenario "as a new user visiting the site" do
    expect{ sign_up }.to change(Maker, :count).by(1)
    expect(page).to have_content("Welcome, Snow White")
    expect(Maker.first.name).to eq("Snow White")
  end

  scenario "with unmatching passwords" do
    expect{ sign_up("Snow White",
                    "red_apple",
                    "snow_white@example.com",
                    "pass",
                    "wrong") }.to change(Maker, :count).by(0)
    expect(current_path).to eq('/makers')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email and/or username that is already registered" do
    expect{ sign_up }.to change(Maker, :count).by(1)
    expect{ sign_up }.to change(Maker, :count).by(0)
    expect(page).to have_content("Email is already taken" || "Username is already taken")
  end

  def sign_up(name = "Snow White",
              username = "red_apple",
              email = "snow_white@example.com",
              password = "seven_dwarfs",
              password_confirmation = "seven_dwarfs")
    visit '/makers/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end


# feature "Maker logs in" do

#   scenario "with correct credentials" do
#   end

#   scenario "with incorrect credentials" do
#   end

# end

# feature "Maker logs out" do

#   scenario "while being signed in" do
#   end

# end
