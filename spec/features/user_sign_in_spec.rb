require 'spec_helper'

feature 'User Sign In' do
  before do
    sign_up
    sign_out
  end

  scenario 'Returning user returns to root page' do
    sign_in
    expect(current_path).to eq('/home')
    expect(page).to have_content('Welcome, Chit Ter')
  end

  scenario 'Unknown Email address' do
    sign_in(email: 'unknown@unknown.com')
    expect(current_path).to eq('/')
    expect(page).to have_content('Incorrect Email/Password')
  end

  scenario 'Incorrect Password' do
    sign_in(password: 'incorrect')
    expect(current_path).to eq('/')
    expect(page).to have_content('Incorrect Email/Password')
  end
end
