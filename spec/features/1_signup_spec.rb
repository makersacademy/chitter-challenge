require 'spec_helper'
require 'web_helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "FEATURE 1: Signup" do

  scenario "1A) Visit signup page" do
    visit '/signup'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end
  scenario "1B) Sign up with email, password, full name and username" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Joe Bloggs')
    expect(User.first.user_email).to eq('joebloggs@hotmail.com')
  end
  scenario "1C) Requires a matching confirmation password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    end









end
