require 'spec_helper'

feature 'user sign up' do

  scenario 'as a new user I can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome, darth")
    expect(User.first.user_name).to eq("darth")
  end

  scenario 'will not allow user to sign up if passwords are mismatched' do
    expect{ sign_up_with_mismatched_password }.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
    expect(current_path).to eq('/users')
  end

  scenario 'will not allow user to sign up without an email address' do
  end

  scenario 'will not allow user to sign up without a name' do
  end

  scenario 'will not allow user to sign up without a user name' do
  end

  scenario 'will not allow user to sign up with an in use email address' do
  end

  scenario 'will not allow user to sign up with an in use user name' do
  end
end
