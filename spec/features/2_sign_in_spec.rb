require 'spec_helper'
require 'web_helper'

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "FEATURE 2: Sign in" do

  let!(:user) do
    User.create(user_email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario "2A) With the correct credentials" do
    sign_in(user_email: user.user_email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.user_email}"
  end

end
