require 'spec_helper'

feature 'Feature - Users can sign up' do
  scenario 'sign up as a new user' do
    visit '/'
    expect(page).to have_content 'Chitter!'
    click_button 'Sign up'
    expect(current_path).to eq '/users/sign-up'
    fill_in :email, with: 'rosie@allott.com'
    fill_in :password, with: 'my_password'
    fill_in :password_confirmation, with: 'my_password'
    click_button 'Submit'
    expect(User.all.size).to eq 1
  end
end
