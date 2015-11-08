require 'spec_helper'

feature 'User sign in' do

  let(:user) do
    User.create(email: 'user@example.com',
              password: 'secret123',
              password_confirmation: 'secret123')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end