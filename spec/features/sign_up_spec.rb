require 'spec_helper'

  feature 'In order to use chitter as a user I want to sign up to the service' do

    scenario "adding a new user increases the number of users by 1" do
      expect{ sign_up }.to change(User, :count).by(1)
    end

    scenario "the correct email for the new user is stored" do
      sign_up
      expect(User.first.email).to eq("alice@example.com")
    end

    scenario "will show a welcome messages after creating a user" do
      sign_up
      expect(page).to have_content("Welcome, alice@example.com")
    end

    scenario "no creation of new user if password confirmation does not match" do
      expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    end

    scenario "unmatched password confirmation will redirect back to sign up page" do
      sign_up('a@a.com', 'pass', 'wrong')
      expect(current_path).to eq'/user/new'
    end

    scenario "return a message if email is already taken" do
      sign_up
      sign_up
      expect(page).to have_content "This email is already taken"
    end

    scenario "will prevent the User table from being updated with duplicate emails" do
      sign_up
      expect{ sign_up }.to change(User, :count).by 0
    end

    def sign_up(email = "alice@example.com",
              password = "oranges!",
              password_confirmation = "oranges!")
      visit '/user/new'
      fill_in :email, :with => email
      fill_in :password, :with => password
      fill_in :password_confirmation, :with => password_confirmation
      click_button "Sign up"
    end


  end
