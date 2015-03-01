require 'spec_helper'
require_relative 'helpers/session_helper'

include SessionHelpers

feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, Costas"
    expect(User.first.username).to eq "Costas"
    expect(User.first.email).to eq "example@example.com"
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "with an email or username that is already registered" do
    expect{ sign_up }.to change(User, :count).by 1
    expect{ sign_up }.to change(User, :count).by 0
    expect(page).to have_content "This email is already taken"
    expect(page).to have_content "This username is already taken"
  end

end


feature "User signs in" do

  before(:each) do
    User.create(:username => "test",
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Welcome, test")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, test")
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content("Welcome, test")
  end

end


feature "User signs out" do

  before(:each) do
    User.create(:username => "test",
                :email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign Out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, test")
  end
end
