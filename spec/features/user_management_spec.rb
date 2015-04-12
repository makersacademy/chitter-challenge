require 'spec_helper'

feature 'User signs up' do

   scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, phoebe')
    expect(User.first.email).to eq('phoebe@phoebeh.com')
  end

  def sign_up(name = 'phoebe hugh',
              username = 'phoebeh',
              email = 'phoebe@phoebeh.com',
              password = '123',
              password_confirmation = '123')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up for Chitter'
  end

  scenario 'with a password that does not match' do
    expect { sign_up('phoebe@phoebeh.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

end
