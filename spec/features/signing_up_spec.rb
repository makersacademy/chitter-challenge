require './app/app.rb'
require 'web_helper'

describe "Sing up" do

  scenario "Users can visit sign up page" do
    visit('/')
    click_button "Sign up"
    expect(page).to have_button("Submit")
  end

  scenario "Users can sign up for Chitter" do
    cat_sign_up
    users = User.all
    expect(users.count).to eq 1
  end

end
