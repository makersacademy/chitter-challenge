require 'spec_helper'
require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Fluff')
    expect(User.first.user_name).to eq('Fluff')
  end
end
