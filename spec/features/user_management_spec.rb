require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs in" do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test',
                :first_name => 'Bob')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Happy peeping Bob!")
    sign_in('test@test.com', 'test')
    expect(page).to have_content("Happy peeping Bob!")
  end

  scenario "with wrong credentials" do
    visit '/'
    expect(page).not_to have_content("Happy peeping Bob!")
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content("Happy peeping Bob!")
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test',
                :first_name => 'Bob')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Happy peeping Bob!")
  end
end

feature "User signs up" do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test',
                :first_name => 'Bob')
  end

  scenario "when being a new user visiting the site" do
    expect{sign_up}.to change(User, :count).by(1)
    expect(User.first.email).to eq("test@test.com")
  end

  scenario "with a password that doesn't match" do
    expect{sign_up('a@a.com','pass','wrong')}.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end
end
