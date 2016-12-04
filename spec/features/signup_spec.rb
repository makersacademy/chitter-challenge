require 'spec_helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'user signup' do
  before(:each) do
    visit '/users/signup'
    fill_in 'email', with: 'vero@test.com'
    fill_in 'password', with: 'password'
    click_button 'Sign up!'
  end

  scenario 'a new user can signup to chitter ' do
    expect { signup }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, vero@test.com')
    expect(User.first.email).to eq('vero@test.com')
  end
end
