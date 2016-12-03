require './app/app.rb'
require 'web_helper'

describe "Sing up" do

  scenario "Users can visit sign up page" do
    visit('/')
    click_button "Sign up"
    expect(page).to have_button("Submit")
  end

  scenario "Users can sign up when they put the same password in confirmation" do
    sign_up
    users = User.all
    expect(users.count).to eq 1
  end

  scenario "Users get error when they didn't put the same password in confirmation" do
    sign_up(password_confirmation: 'wrong')
    users = User.all
    expect(users.count).to eq 0
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "Users cannot sign up if they did't provide email" do
    expect{ sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario 'Users cannot sign up with an invalid email address' do
    sign_up
    expect { sign_up(email: "cat@email.com") }.not_to change(User, :count)
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content('Email is already taken')
  end

end
