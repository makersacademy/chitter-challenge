require 'spec_helper'

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, aporkinson@gmail.com")
    expect(User.first.email).to eq("aporkinson@gmail.com")
  end

  def sign_up(email = "aporkinson@gmail.com",
              password = "letmein")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end
  
end
