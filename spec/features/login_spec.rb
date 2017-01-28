require 'spec_helper'

feature 'Log in' do
  let!(:user) do
    User.create(email: 'eric@example.com',
                password: 'password1',
                password_confirmation: 'password1')
  end
  scenario 'can login if correct email and password' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "You are logged in as #{user.email}"
  end
end

feature 'Log out' do
  before(:each) do
    User.create(email: 'eric@example.com',
                password: 'password1',
                password_confirmation: 'password1')
  end
  scenario 'can logout' do
    sign_in(email: 'eric@example.com', password: 'password1')
    click_button 'Logout'
    expect(page).to have_content('You are now logged out')
    expect(page).not_to have_content('You are logged in as eric@example.com')
  end
end
