require 'spec_helper'

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, kate@kate.com")
    expect(User.first.email).to eq("kate@kate.com")
  end

  def sign_up(email = "kate@kate.com",
              password = "kate",
              password_confirmation = "kate",
              name = "kate beavis",
              username = "kittykat")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    fill_in :name, :with => name
    fill_in :username, :with => username
    click_button 'Sign up'
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up 'kate@kate.com', 'kate', 'kat'}.to change(User, :count).by (0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "with an email that has already been registered" do
    expect{ sign_up }.to change(User, :count).by (1)
    expect{ sign_up }.to change(User, :count).by (0)
    expect(page).to have_content("Email is already taken")
  end

end









