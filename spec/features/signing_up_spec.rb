require './app/app.rb'
require 'web_helper'

describe "Sing up" do

  scenario "Users can visit sign up page" do
    visit('/')
    click_button "Sign up"
    expect(page).to have_button("Submit")
  end

  scenario "Users can sign up when they put the same password in confirmation" do
    cat_sign_up
    users = User.all
    expect(users.count).to eq 1
  end

  scenario "Users get error when they didn't put the same password in confirmation" do
    cat_sign_up_wrong
    users = User.all
    expect(users.count).to eq 0
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content("Your passwords don't match")
  end

end
