require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, joema!"
    expect(User.first.email).to eq "joe@ma.com"
  end

end
