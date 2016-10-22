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
    sign_up_with_missing_email
    fill_in('email', with: nil)
    click_button('Sign up')
    expect(current_path).to eq('/users')
    expect(User.count).to eq 0
  end

  scenario "checks email address is valid" do
    sign_up_with_missing_email
    fill_in('email', with: "abd.abdn.123")
    click_button('Sign up')
    expect(User.count).to eq 0
  end
end
