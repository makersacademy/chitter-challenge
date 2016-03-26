require 'web_helper'

feature 'User management' do
  scenario 'User can sign up with username, email, password' do
    sign_up
    expect(page).to have_content('Welcome to Chitter, jon snow!')
  end
end
