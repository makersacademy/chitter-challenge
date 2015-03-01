require 'spec_helper'

  feature "User sign up" do

    scenario "new user sign up" do
      visit '/'
      expect{sign_up}.to change(User,:count).by(1)
      expect(page).to have_content("Welcome jdoe!")
      expect(User.first.username).to eq("jdoe")
    end

    scenario "with an email that already exists in the DB" do
      expect{sign_up}.to change(User,:count).by(1)
      expect{sign_up}.to change(User,:count).by (0)
      expect(page).to have_content("Email is already taken")
    end

    scenario "with a username that alredy exists in the DB" do
      expect{sign_up}.to change(User,:count).by(1)
      expect{sign_up}.to change(User,:count).by (0)
      expect(page).to have_content("Username is already taken")
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


  feature "User signs in" do
    before (:each) do
      User.create(:email => "hello@hello.com",
                  :password => "qwerty",
                  :username => "hellokitty")
    end

    scenario "correct credentials" do
      visit '/'
      expect(page).not_to have_content("Welcome hellokitty!")
      sign_in("hello@hello.com", "qwerty")
      expect(page).to have_content("Welcome hellokitty!")
    end

    scenario "with the incorrect credentials" do
      visit '/'
      expect(page).not_to have_content("Welcome hellokitty!")
      sign_in("hello@hello.com", "wrong")
      expect(page).not_to have_content("Welcome hellokitty!")
    end


    def sign_in(email,password)
      visit '/sessions/new'
      fill_in "email", :with => email
      fill_in "password", :with => password
      click_button "Sign in"
    end

  end









