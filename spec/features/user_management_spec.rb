require 'spec_helper'

feature 'signing in' do
  scenario 'signing up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, Ed')
    expect(User.first.user_name).to eq('Ed')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('a', 'a@a.com', 'p', 'w') }.to change(User, :count).by 0
    expect(current_path).to eq('/user')
    expect(page).to have_content('Sorry, your passwords don\'t match')
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

  xscenario 'can sign in' do
    visit '/'
    click_button 'Sign in'
    fill_in 'Username', with: user_name
    fill_in 'password', with: password
    click_button 'Sign in'
    expect(page).to have_content('Welcome to Chitter')
  end
  xscenario 'can sign in' do
  end
  xscenario 'can sign out' do
  end

end
