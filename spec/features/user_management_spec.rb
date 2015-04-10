require 'spec_helper'

feature 'signing in' do
  scenario 'signing up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, Ed')
    expect(User.first.user_name).to eq('Ed')
  end

  def sign_up(user_name = 'Ed', email = 'ed@ed.com',
              password = '123', password_confirmation = '123')
    visit '/user/new'
    expect(page.status_code).to eq 200
    fill_in 'user_name', with: user_name
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Register'
  end

  xscenario 'can sign up' do
    visit '/'
    click_button 'Sign up now'
    fill_in 'Username', with: user_name
    fill_in 'Email', with: email
    fill_in 'password', with: password
    fill_in 'Confirm Password', with: confirm_password
    click_button 'Register'
    expect(page).to have_content('Welcome to Chitter')
  end
  xscenario 'can sign in' do
  end
  xscenario 'can sign out' do
  end

end
