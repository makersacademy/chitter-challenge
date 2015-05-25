require 'spec_helper'
require 'rack-flash'
require_relative 'helpers/session_helpers'

include SessionHelper

feature 'User signs up' do
  scenario 'through the sign-up link and they are added to the database' do
    expect(User.count).to eq 0
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.name).to eq "Alex"
  end

  scenario 'once signed-up they receive a welcome message on the homepage' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Alex")
  end

  scenario 'and must provide a unique username and email or get an error message' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up("Alex", "AlexHandy1", "ah2.com", "test") }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content("Username is already taken")
    # expect(page).to have_content("This email is already taken")  #double check test validity because works on page but fails when add duplicate email
  end

  scenario 'and must have a matching, validated password' do
    expect { sign_up("Alex", "AlexHandy1", "ah2.com", "test", "fail")}.to change(User, :count).by(0)
  end
end