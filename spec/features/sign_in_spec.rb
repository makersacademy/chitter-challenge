require 'spec_helper'

feature 'User sign in' do

  let!(:user) do
    User.create(name: 'Bob',
    username: 'Bobmcbobface',
    email: 'bob@bob.com',
    password: 'pwd')
  end

  scenario 'with correct credentials' do

    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
