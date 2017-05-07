require 'spec_helper'

describe Chitter do

  feature 'Sign up user' do

    scenario 'When I visit the home page, I see a sign up prompt' do
      visit('/')
      expect(page).to have_content("Don't have an account yet? Don't worry! Chitter is free for anyone to use!")
      expect(page).to have_button("Sign Up")
    end

    scenario 'When I click the Sign Up button, I get redirected to the /sign_up view' do
      visit_sign_up_page
      expect(page).to have_current_path('/sign_up')
    end

    scenario 'When I get redirected to the /sign_up view, I see an input prompt for my account details' do
      visit_sign_up_page
      expect(page).to have_content('Signing up for Chitter is an excellent decision Tell us about yourself!Please enter your account details below First Name: Last Name: Email: Create Username: Create Password: Confirm Password:')
    end

    scenario "In the /sign_up view I get prompted to enter a new username" do
      visit_sign_up_page
      expect(page).to have_content("Create Username")
      expect(page).to have_field("new_username")
    end

    scenario "In the /sign_up view I get prompted to enter a new password" do
      visit_sign_up_page
      expect(page).to have_content("Create Password")
      expect(page).to have_field("new_password")
    end

    scenario "In the /sign_up view I get prompted to confirm my new password" do
      visit_sign_up_page
      expect(page).to have_content("Confirm Password")
      expect(page).to have_field("new_password_confirm")
    end

    scenario "When I click 'Create Account' a new user with the given parameters is created" do
      visit_sign_up_page
      enter_newusername_and_newpassword
      click_button("Create Account")
      expect(User.last.first_name).to eq "test_first_name"
      expect(User.last.last_name).to eq "test_last_name"
      expect(User.last.email).to eq "test_email"
      expect(User.last.user_name).to eq "test_username"
    end

    scenario "When I click 'Create Account' I get redirected to my personal feed, with a welcome message" do
      visit_sign_up_page
      enter_newusername_and_newpassword
      click_button("Create Account")
      expect(page).to have_current_path("/feed/:current_user")
      expect(page).to have_content("You are logged in as test_first_name test_last_name")
    end


    # scenario "When I click 'Create Account' a new user is created and the password encrypted" do
    #   visit_sign_up_page
    #   enter_newusername_and_newpassword
    #   click_button("Create Account")
    #   expect(User.last.password_digest).to_not eq "test_password"
    # end

  end
end
