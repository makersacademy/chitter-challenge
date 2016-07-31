require 'spec_helper'

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'oscar@fierce.com',
                name: 'Oscar Wilde',
                user_name: 'carnation',
                password: 'green',
                password_confirmation: 'green')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
