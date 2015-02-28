require 'spec_helper'

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, kate@kate.com")
    expect(User.first.email).to eq("kate@kate.com")
  end

  def sign_up(email = "kate@kate.com",
              password = "kate")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    # fill_in :name, :with => name
    # fill_in :username, :with => username
    click_button 'Sign up'
  end

end