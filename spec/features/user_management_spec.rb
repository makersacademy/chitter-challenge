require "spec_helper"
require "./app/models/user"
require_relative "web_helpers"

feature "User sign up" do
  scenario "A new user can sign up" do
    expect{sign_up(password_confirmation: 'admin')}.to change(User, :count).by 1
    expect(page).to have_content("Welcome, Ed")
    expect(User.first.email).to eq("ed@gmail.com")
  end

  scenario "A non-matching password confirmation will be rejected" do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_text 'The two passwords provided do not match'
  end
end
