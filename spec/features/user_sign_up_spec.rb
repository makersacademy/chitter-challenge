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

  scenario 'and must provide a unique username and email' do

  end

  scenario 'and must have a matching, validated password' do

  end

end