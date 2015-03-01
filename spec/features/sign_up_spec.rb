require 'spec_helper'
require_relative './helpers/sign_up.rb'

  feature 'In order to use Chitter as a user I want to sign up to the service' do

    scenario "adding a new user increases the number of users by 1" do
      expect{ sign_up }.to change(User, :count).by(1)
    end

    scenario "the correct email for the new user is stored" do
      sign_up
      expect(User.first.email).to eq("alice@example.com")
    end

    scenario "welcome messages is shown after creating a user" do
      sign_up
      expect(page).to have_content("Welcome, alice@example.com")
    end

    scenario "mismatching password/password confirmation will not create a user" do
      expect{ sign_up('a@a.com','Bobby1','Bob Smith' 'pass', 'wrong')}.to change(User, :count).by(0)
    end

    scenario "mismatching password confirmation will redirect user back to sign up page" do
      sign_up('a@a.com','Bobby1','Bob Smith' 'pass', 'wrong')
      expect(current_path).to eq'/user/new'
    end

    scenario "return a message if email is already taken" do
      sign_up
      sign_up('alice@example.com','Bobby1','Bob Smith' 'pass', 'pass')
      expect(page).to have_content "This email is already taken"
    end


    scenario "return a message if 'user name' is already taken" do
      sign_up
      sign_up
      expect(page).to have_content "This user is already taken"
    end

    scenario "will prevent the User table from being updated with duplicate emails" do
      sign_up
      expect{ sign_up }.to change(User, :count).by 0
    end




  end
