require 'web_helper'

feature 'Chitter User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, @JonesL')
    expect(User.first.name).to eq('Lisa Jones')
  end
end
