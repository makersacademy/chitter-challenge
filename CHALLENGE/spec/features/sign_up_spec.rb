require 'spec_helper'

# USER STORY ONE
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up' do

  scenario 'there is an option to sign up on the home page' do
    visit '/homepage'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Join the Chitter community'
  end

  scenario 'a user can sign up and are directed to their own login page' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'username'
    expect(User.first.email).to eq('user@example.com')
  end

end
