require 'spec_helper'


feature "User signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, alice@example.com")
  end

  # def sign_up(email = "alice@example.com",
  #             password = "oranges!")
  #   visit '/users/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :email, :with => email
  #   fill_in :password, :with => password
  #   click_button "Sign up"
  # end

  scenario "with a password that doesn't match" do
    expect{ sign_up('riz', 'riz', 'a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your password don't match")
  end

  scenario "with an email that is already registered" do


  end

  def sign_up(name = "riz",
              user_name = "riz",
              email = "alice@example.com",
              password = "oranges!",
              password_confirmation = "oranges!")
      visit '/users/new'
      fill_in :name, :with => name
      fill_in :user_name, :with => user_name
      fill_in :email, :with => email
      fill_in :password, :with => password
      fill_in :password_confirmation, :with => password_confirmation
      click_button "Sign up"
  end

end

