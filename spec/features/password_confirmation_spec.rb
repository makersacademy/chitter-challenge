require 'spec_helper'

RSpec.feature 'password confirmation' do
  scenario 'mismatching password error' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: 'John Smith'
    fill_in :user_name, with: 'j.smith90'
    fill_in :email, with: 'john.smith@example.co.uk'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'passwort'

    expect {click_button 'Create User Account'}.to change(User, :count).by(0)
    expect(page).to have_content('Password missmatch')
  end
end
