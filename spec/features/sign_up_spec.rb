require 'sign_up_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'Users can sign up' do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com'
    expect(page).to have_content "Hello, Hivemind"
  end

  scenario "Users can't sign up with a username that already exists" do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com'
    sign_up 'Someone Else', 'Hivemind', 'someone_else@hotmail.com'
    expect(page).to have_content "Those details are already in use"
  end

  scenario "Users can't sign up with an email that's already in use" do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com'
    sign_up 'Someone Else', 'Hives', 'me@hotmail.com'
    expect(page).to have_content "Those details are already in use"
  end
end
