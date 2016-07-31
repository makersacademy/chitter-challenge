require './web_helper'

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'bart@example.com',
                  password: 'password',
                  user_name: 'The Judge'))
  end

  scenario 'log in with correct details' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end


end
