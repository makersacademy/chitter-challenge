require 'spec_helper'

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, Costas"
    expect(User.first.username).to eq "Costas"
    expect(User.first.email).to eq "example@example.com"
  end

  def sign_up(username = "Costas",
              email = "example@example.com",
              password = "12345")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign Up"
  end

end