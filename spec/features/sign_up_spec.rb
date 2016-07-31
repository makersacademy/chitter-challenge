require 'spec_helper'

feature 'user sign up' do
  scenario 'user can sign up' do
    sign_up
    expect(page).to have_content('Welcome suse!')
  end

  scenario 'on user sign-in increase user count by one' do
    sign_up
    expect(User.count).to eq 1
    end
