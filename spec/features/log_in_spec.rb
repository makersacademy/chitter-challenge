require 'spec_helper'
require_relative 'web_helpers'

feature 'User logging in' do

  let!(:user) do
    User.create(email: 'user@example.com', password: 'secret1234', password_confirm: 'secret1234')
  end

  scenario 'User can log in with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
