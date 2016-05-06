require 'spec_helper'
require 'web_helper'

feature 'User sign in' do

  let(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234',
                name: 'chris',
                user_name: 'chris')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end


end
