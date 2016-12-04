require 'spec_helper'
require 'web_helpers'

feature "So a new user can sign up for Chitter" do
  scenario 'new user enters credentials' do
    sign_in
    expect(page).to have_content('Welcome to Chitter, James')
  end

  scenario 'A user cannot sign up with a taken username' do
    sign_in
    sign_in
    expect{password_mismatch}.not_to change{User.count}
  end

  scenario 'A user cannot sign up if password does not match confirmation' do
    expect{password_mismatch}.not_to change{User.count}
  end
end
