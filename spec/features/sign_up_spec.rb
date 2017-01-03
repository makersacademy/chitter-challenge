require 'spec_helper'

feature "When signing up" do

  scenario "can create a user" do
    expect{sign_up}.to change{User.count}.from(0).to(1)
    expect(page).to have_content("Welcome Isabel")
  end

  scenario "a user can't sign up with a blank email" do
    expect{sign_up(email: "")}.not_to change{User.count}
  end

  scenario "a user can't sign up with a blank user name" do
    expect{sign_up(username: "")}.not_to change{User.count}
  end

  scenario "a user can't sign up with an invalid email" do
    expect{sign_up(email: "isabel@g")}.not_to change{User.count}
  end

  scenario "a user can't sign up with a wrong password confirmation" do
    expect{sign_up(password_confirmation: "rest")}.not_to change{User.count}
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "a user can't sign up with email already taken" do
    sign_up
    expect{sign_up}.not_to change{User.count}
    expect(page).to have_content("Email is already taken")
  end

  scenario "a user can't sign up with a username already taken" do
    sign_up
    expect{sign_up(email: "test@test.com")}.not_to change{User.count}
    expect(page).to have_content("Username is already taken")
  end
end
