require 'spec_helper'
require_relative '../../app/views/helpers/sessions'

include SessionHelpers

feature "User signs in" do

  before(:each) do
    User.create(:email => "guido@gmail.com",
                :password => 'guido',
                :password_confirmation => 'guido')
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, guido@gmail.com")
    sign_in('guido@gmail.com', 'guido')
    expect(page).to have_content("Welcome, guido@gmail.com")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, guido@gmail.com")
    sign_in('guido@gmail.com', 'wrong')
    expect(page).not_to have_content("Welcome, guido@gmail.com")
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(:email => "guido@guido.com",
                :password => 'guido',
                :password_confirmation => 'guido')
  end

  scenario 'while being signed in' do
    sign_in('guido@guido.com', 'guido')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, guido@guido.com")
  end
end


feature "User signs up" do
  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, guido@gmail.com")
    expect(User.first.email).to eq("guido@gmail.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('guido@gmail.com', 'password', 'passwod') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end
end





