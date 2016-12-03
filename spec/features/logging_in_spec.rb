require './app/app.rb'
require 'web_helper'

describe "Log in" do

  scenario "Users can visit log in page" do
    visit('/')
    click_button "Log in"
    expect(page).to have_button("Submit")
  end

  scenario "Users get error if the user hasn't signed up" do
    cat_log_in
    expect(page).to have_content("You haven't signed up yet!")
  end

  scenario "Users go back index page if the user has signed up" do
    cat_sign_up
    cat_log_in
    expect(current_path).to eq('/')
  end

  scenario "Users see their name correctly after logging in even different person was logged in before." do
    cat_sign_up
    dog_sign_up
    cat_log_in
    expect(page).to have_content("Welcome, CAT!")
  end

end
