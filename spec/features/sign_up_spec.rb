require 'spec_helper'

feature 'Sign up' do
  scenario 'New user signs up' do
    visit '/'

    click_link 'Sign up'
    fill_in 'username', with: 'User'
    fill_in 'email',    with: 'user@nomail.com'
    fill_in 'name',     with: 'First Last'
    fill_in 'password', with: 's3cr3t'
    fill_in 'pwd_conf', with: 's3cr3t'

    expect { click_button 'Submit' }.to change(User, :count).by 1
    expect(User.first.email).to eq 'user@nomail.com'
    expect(page).to have_content 'Welcome User'
  end
end
