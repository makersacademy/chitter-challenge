require './spec/spec_helper'

feature 'User sign up' do
  scenario 'User can visit sign up page' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    find_field('Email').value
    find_field('Password').value
    expect(page).to have_button('Sign up')
  end

  scenario 'New user is created' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@email.com')
    expect(User.first.email).to eq('user@email.com')
  end

end
