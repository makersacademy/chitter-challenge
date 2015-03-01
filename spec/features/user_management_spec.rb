require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do

  scenario "when first visiting the homepage" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, chitty1")
    expect(User.first.name).to eq("John Smith")
    expect(User.first.username).to eq("chitty1")
    expect(User.first.email).to eq("test@test.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('John Smith','chitty1', 'test@test.com', 'pass', 'wrong')}.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email or username that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("Email is already taken")
    expect(page).to have_content("Username is already taken")
  end
end

feature "User signs in" do

  before(:each) do
  User.create(:username => "chitty1", :password => "testing", :password_confirmation => "testing")
end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, chitty1")
    sign_in("chitty1", "testing")
    expect(page).to have_content("Welcome, chitty1")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, chitty1")
    sign_in("chitty1", 'wrong')
    expect(page).not_to have_content("Welcome, chitty1")
  end
end

feature "User signs out" do

  before(:each) do
    User.create(:username => "chitty1", :password => "testing", :password_confirmation => "testing")
  end

  scenario "while being signed in" do
    sign_in("chitty1", "testing")
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, chitty1")
  end

end