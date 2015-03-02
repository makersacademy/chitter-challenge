require 'spec_helper'
require_relative 'helpers/session'

feature "User signs up" do

  include SessionHelpers

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Signed in as Chris")
    expect(User.first.email).to eq("chris@hello.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

   scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    click_button "Sign out"
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end

end

feature "User signs in" do

  include SessionHelpers

  before(:each) do
    User.create(:username => "Chris",
                :email => "chris@chris.com",
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Signed in as Chris")
    sign_in('chris@chris.com', 'password')
    expect(page).to have_content("Signed in as Chris")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Signed in as Chris")
    sign_in('chris@chris.com', 'wrong')
    expect(page).not_to have_content("Signed in as Chris")
  end

end

feature 'User signs out' do

  include SessionHelpers

  before do
    User.create(:username => "Chris",
                :email => "chris@chris.com",
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'while being signed in' do
    sign_in('chris@chris.com', 'password')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Signed in as Chris")
  end

end

feature "other URI's redirect to home if user is signed in" do

include SessionHelpers

  before do
    User.create(:username => "Chris",
                :email => "chris@chris.com",
                :password => 'password',
                :password_confirmation => 'password')
  end

  scenario 'while being signed in try to visit sign in page' do
    sign_in('chris@chris.com', 'password')
    visit '/sessions/new'
    expect(page).to have_content("Signed in as Chris")
  end

end
