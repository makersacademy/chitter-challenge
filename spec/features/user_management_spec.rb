require 'spec_helper'

feature 'User sign up,' do

  scenario 'I can sign up as a new user.' do
    user = build(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(User.first.email).to eq "roy@reynholm.co.uk"
  end

  scenario 'I cannot sign up with an existing email' do
    user = create(:user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end

end

feature 'User sign in' do

  scenario 'with correct credentials' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end

feature 'User signs out' do

  xscenario 'while being signed in' do
    user = create(:user)
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, alice@example.com')
  end

end
