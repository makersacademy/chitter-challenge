require 'helpers'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up' do

  scenario "Shows a welcome message on the front page" do
    visit '/'
    expect(page).to have_content("Welcome to Chitter")
  end

  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content("Welcome, Noora-q")
  end

end
