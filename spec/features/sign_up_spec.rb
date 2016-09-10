require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, matt@matt.com')
    expect(User.first.email).to eq('matt@matt.com')
    expect(User.count).to eq(1)
  end

  scenario 'password confirmation' do
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'matt@matt.com'
    fill_in :password, with: 'vickers'
    fill_in :password_confirmation, with: 'somethingelse'
    click_button 'Sign up'
    expect(User.count).to eq(0)
  end

end
