require 'spec_helper'

feature "User signs up" do

scenario "when being a new user visiting the site" do
  expect{ sign_up }.to change(User, :count).by(1)
  expect(page).to have_content("Welcome, diego@example.com")
  expect(User.first.email).to eq("diego@example.com")
  end

  def sign_up(email ="diego@example.com", password = "test")
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
  
    click_button "Sign up"
  end
  

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

  def sign_up(email ="diego@example.com", password = "test",
              password_confirmation = "test")
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end
  
end

