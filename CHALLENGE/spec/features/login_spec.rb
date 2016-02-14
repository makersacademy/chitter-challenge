require 'spec_helper'

# USER STORY TWO
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Logining in' do

  let(:user) do
    User.create(username: 'username',
                email:    'user@example.com',
                password: 'password')
  end

  scenario 'sign in possible with correct credentials' do
    sign_in(email: user.email, password: user.password_digest)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end
