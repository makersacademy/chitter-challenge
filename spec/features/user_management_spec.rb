require 'spec_helper'

feature 'User signs up' do

  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Sammy')
    expect(User.first.email).to eq('sammy@example.com')
  end

  scenario 'with a password that doesnt match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

  def sign_up(name = 'Sammy',
              password = 'lolol',
              password_confirmation = 'lolol',
              username = 'Vinyls',
              email = 'sammy@example.com')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
