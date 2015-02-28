require 'spec_helper'
require './app/helpers/session'

include SessionHelpers

feature "User signs up" do

  scenario "when a new user visits the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, superkev")
    expect(User.first.name).to eq("Kev")
    expect(User.first.username).to eq("superkev")
    expect(User.first.email).to eq("kevinlanzon@gmail.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('Kev','superkev', 'kevinlanzon@gamil.com', 'pass', 'wrong')}.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

  scenario 'while being logged out' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, superkev")
    expect(User.first.email).to eq("kevinlanzon@gmail.com")
    expect(User.first.username).to eq("superkev")
    expect(User.first.name).to eq("Kev")
  end
end

feature "User signs in" do

  before(:each) do
  User.create(:username => "superkev", :password => "chitbags", :password_confirmation => "chitbags")
end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, superkev")
    sign_in("superkev", "chitbags")
    expect(page).to have_content("Welcome, superkev")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, superkev")
    sign_in("superkev", 'wrong')
    expect(page).not_to have_content("Welcome, superkev")
  end
end

feature "User signs out" do

  before(:each) do
    User.create(:username => "superkev", :password => "chitbags", :password_confirmation => "chitbags")
  end

  scenario "while being signed in" do
    sign_in("superkev", "chitbags")
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, superkev")
  end

end