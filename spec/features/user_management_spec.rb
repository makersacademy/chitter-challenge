require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

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

  end


  feature "User signs out" do

    before (:each) do
      User.create(:email => "hello@hello.com",
                  :password => "qwerty",
                  :username => "hellokitty")
    end

    scenario "when user signs out of the service" do
      sign_in("hello@hello.com", "qwerty")
      click_button "Sign out"
      expect(page).to have_content("Goodbye!")
      expect(page).not_to have_content("Welcome hellokitty!")
    end

  end









