require 'spec_helper'


feature "So that I can post messages on Chitter" do

  scenario "I want to sign up" do
    visit '/'
    click_link('signup')
    expect { user_sign_up }.to change(User, :count).by(1)
  end

  scenario "sign up should detect if there is a password mismatch" do
    visit '/'
    click_link('signup')
    expect { user_sign_up(password_confirmation: "fault") }.not_to change(User, :count)
  end

  scenario "I want to log in to Chitter" do
    visit '/'
    click_link('signup')
    user_sign_up
    click_link('signout')
    click_link('signin')
    expect(page).to have_content("Please Sign In")
    user_sign_in
    expect(page).to have_content("Hi, David Jones!")
  end

  scenario "I want to be able to log out" do
    visit '/'
    click_link('signup')
    user_sign_up
    click_link('signout')
    click_link('signin')
    expect(page).to have_content("Please Sign In")
    user_sign_in
    expect(page).to have_content("Hi, David Jones!")
    user_sign_out
    expect(page).to have_content("Hi, you need to sign in/up to post peeps!")
  end

end
