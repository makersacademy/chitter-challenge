require 'spec_helper'
require 'web_helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "FEATURE 1: Signup" do

  scenario "1A) By visiting the signup page" do
    visit '/signup'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end
  scenario "1B) With email, password, full name and username" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Joe Bloggs')
    expect(User.first.user_email).to eq('joebloggs@hotmail.com')
  end
  scenario "1C) Requires a matching confirmation password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    end

  scenario '1D) With a password that does not match' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
  expect(page).to have_content 'Erm...Your password and confirmation password do not match'
  end

  scenario "1E) Not possible without an email address" do
    expect { sign_up(user_email: nil) }.not_to change(User, :count)
  end









end
