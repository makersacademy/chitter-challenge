require "spec_helper"
require "./app/models/user"
require_relative "web_helpers"

feature "User sign up" do
  scenario "A new user can sign up" do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content("Welcome, Ed")
    expect(User.first.email).to eq("ed@gmail.com")
  end
end
