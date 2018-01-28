require 'spec_helper'

feature 'Logging in an existing user' do
  let!(:user) do
    User.create(email: 'agata@google.com',
                password: 'mypassword1', username: 'AgataGo')
  end

  scenario 'exisitng user can log in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}!"
  end

  def sign_in(email:, password:)
    visit('/')
    fill_in :email, with: email
    fill_in :password, with: password
    click_button('Sign in')
  end

end
