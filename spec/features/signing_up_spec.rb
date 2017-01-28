require './spec/spec_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up' do
  scenario "so I can sign up to Chitter" do
    sign_up
    expect(page).to have_content('Welcome m1k3')
  end
  scenario 'increases the user count' do
    expect{sign_up}.to change{User.count}.by(1)
  end
end
