require 'spec_helper'
require_relative '../web-helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario "I want to sign up with email, password, name and username" do
    sign_up
    expect(page.status_code).to eq 200
  end
end
