require 'spec_helper'

  feature "User sign up" do

    scenario "new user sign up" do
      visit '/'
      expect{sign_up}.to change(User,:count).by(1)
      expect(page).to have_content("Welcome jdoe!")
      expect(User.first.username).to eq("jdoe")
    end

    def sign_up(email = "johndoe@test.com",
                password = "qwerty",
                username = "jdoe")
      visit '/users/new'
      fill_in :email, :with => email
      fill_in :password, :with => password
      fill_in :username, :with => username
      click_button "Sign up"
    end


  end