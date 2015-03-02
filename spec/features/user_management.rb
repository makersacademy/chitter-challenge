require 'spec_helper'


feature "User signs up" do

  # Strictly speaking, the tests that check the UI
  # (have_content, etc.) should be separate from the tests
  # that check what we have in the DB. The reason is that
  # you should test one thing at a time, whereas
  # by mixing the two we're testing both
  # the business logic and the views.
  #
  # However, let's not worry about this yet
  # to keep the example simple.
  scenario "when being a new user visiting the site" do
  expect { sign_up }.should change(User, :count).by(1)    
  expect(page).to have_content("Welcome, diego@example.com")
  expect(User.first.email).to eq("diego@example.com")
  end
  #   scenario "when being logged out" do    
  #   lambda { sign_up }.should change(User, :count).by(1)    
  #   expect(page).to have_content("Welcome, alice@example.com")
  #   expect(User.first.email).to eq("alice@example.com")        
  # end

  def sign_up(email ="diego@example.com", password = "test")
    visit '/users/new'
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

end 

