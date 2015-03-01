require 'spec_helper'

feature "Maker signs up" do

  scenario "as a new user visiting the site" do
    expect{ sign_up }.to change(Maker, :count).by 1
    expect(page).to have_content("Welcome, Snow White")
    expect(Maker.first.name).to eq("Snow White")
  end


  def sign_up(name = "Snow White",
              username = "red_apple",
              email = "snow_white@example.com",
              password = "seven_dwarfs")
    visit '/makers/new'
    # expect(page.status_code).to eq(200)
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

  # scenario "with unmatching passwords" do
  # end

end


# feature "Maker logs in" do

#   scenario "with correct credentials" do
#   end

#   xscenario "with incorrect credentials" do
#   end

# end

# feature "Maker logs out" do

#   scenario "while being signed in" do
#   end

# end
