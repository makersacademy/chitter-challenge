require 'spec_helper'
require './app/models/user'

def sign_up
  visit '/signup'
  fill_in :email, with: 'vero@example.com'
  fill_in :password, with: 'password!'
  click_button 'Sign up'
end

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page.status_code).to eq 200
    expect { sign_up }.to change(User, :count).by(1)
  end

end
