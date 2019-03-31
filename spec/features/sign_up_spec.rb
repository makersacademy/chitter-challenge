require 'sign_up_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'Users can sign up' do
    sign_up 'Paul Martin', 'Hivemind'
    expect(page).to have_content("Hello, Hivemind")
  end
end
