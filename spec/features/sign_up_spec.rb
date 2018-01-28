require 'web_helper'

feature 'User sign up' do
  scenario 'user can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, Homer')
    expect(User.last.email).to eq('Homerj@gmail.com')
  end
end
