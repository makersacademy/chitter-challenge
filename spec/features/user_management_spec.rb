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
    expect(page).to have_content("Logged in as: Noora-q")
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'User sign in' do
  scenario 'I can sign in as a user' do
    create_user
    sign_in
    expect(page).to have_content("Logged in as: Noora-q")
  end
end
