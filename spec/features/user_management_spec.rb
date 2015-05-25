require 'spec_helper'

feature 'User signs up' do

  scenario 'when a new user visits the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alib@b@')
    expect(User.first.username).to eq('Alib@b@')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords do not match')
  end

  scenario 'with an email that is already registered' do
  expect { sign_up }.to change(User, :count).by(1)
  expect { sign_up }.to change(User, :count).by(0)
  expect(page).to have_content('This email is already taken')
end

  def sign_up(email = 'alib@b@@example.com', username = 'Alib@b@', password = 'genius!', password_confirmation = 'genius!')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Join Chatter!'
  end



end
