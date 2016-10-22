require 'spec_helper'
require 'web_helper'

feature "Sign up" do
  scenario "new users can sign up" do
    expect{ sign_up }.to change(User, :count).by 1
  end

  scenario "requires matching confirmation password" do
    expect{ sign_up(password_confirmation: "1234") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password and confirmation password do not match"
  end

  scenario "requires email address to be provided" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Please enter your email address")
  end

  scenario "checks email address is valid" do
    expect { sign_up(email: "abd.dfe.email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Invalid email address")

  end

  scenario "check email address is unique" do
    sign_up
    sign_up
    expect(User.count).to eq 1
    expect(page).to have_content "This email has already been registered"
  end
end
