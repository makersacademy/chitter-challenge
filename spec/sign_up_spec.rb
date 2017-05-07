require 'spec_helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'signing up to Chitter' do
  scenario 'I provide my user info and user gets created' do
    expect { sign_up }.to change { User.all.count }.by 1
  end
  scenario 'it takes me to the main page and welcomes me' do
    sign_up
    expect(page).to have_content('euskaldun')
  end
end
