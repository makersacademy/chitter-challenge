require 'spec_helper'

feature 'User signs up' do

  scenario 'when a new user visits the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to blabber!
                                  Are you ready to blabb?!!!')
    expect(User.first.email).to eq('test@blabber.com')
  end

  scenario 'when a user password does not match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.should
    change(User, :count).by(0)
  end

  def sign_up(name = 'aaa', username = 'ccc',
              email = 'test@blabber.com',
              password = 'ddd',
              password_confirmation = 'ddd')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end