require 'sign_up_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'Users can sign up' do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com', 'password'
    expect(page).to have_content "Hello, Hivemind"
  end

  scenario "Users can't sign up with a username that already exists" do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com', 'password'
    sign_up 'Someone else', 'Hivemind', 'me@gmail.com', 'password'
    expect(page).to have_content 'Those details were no good'
  end

  scenario "Users can't sign up with an email that's already in use" do
    sign_up 'Paul Martin', 'Hivemind', 'me@hotmail.com', 'password'
    sign_up 'Someone else', 'Hives', 'me@hotmail.com', 'password'
    expect(page).to have_content 'Those details were no good'
  end

  scenario "Users must enter a name to sign up" do
    sign_up '', 'Hivemind', 'me@hotmail.com', 'password'
    expect(page).to have_content 'Those details were no good'
  end

  scenario "Users must enter a username to sign up" do
    sign_up 'Paul Martin', '', 'me@hotmail.com', 'password'
    expect(page).to have_content 'Those details were no good'
  end

  scenario "Users must enter an email to sign up" do
    sign_up 'Paul Martin', 'Hivemind', '', 'password'
    expect(page).to have_content 'Those details were no good'
  end
end
