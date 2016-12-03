require './app/app.rb'
require 'web_helper'

describe "Log in" do

  scenario "Users can visit log in page" do
    visit('/')
    click_button "Log in"
    expect(page).to have_button("Submit")
  end

  scenario "Users can error if the user hasn't signed up" do
    log_in
    expect(page).to have_content("You haven't signed up yet!")
  end

  scenario "Users go back index page if the user has signed up" do
    sign_up
    log_in
    expect(page).to have_xpath('/')
  end

end
