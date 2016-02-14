require 'web_helper'

feature 'user can sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, reiss1994')
    expect(User.first.email).to eq('reissjohnson@me.com')
  end
end
