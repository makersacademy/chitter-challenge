# require 'spec_helper'

feature 'User signs up' do
  scenario 'when being a new user visiting Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello Sexy_frenchman')
    expect(User.first.email).to eq('Guillaume@chittest.com')
  end

  scenario 'with a password that doesn\'t match' do
    expect { sign_up('a@bc.com', 'abc', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

#   scenario 'with an email that is already registered' do
#   end

#   scenario 'with a Username that is already registered' do
#   end
end

  def sign_up(email = 'Guillaume@chittest.com',
              username = 'Sexy_frenchman',
              password = 'helloworld',
              password_confirmation = 'helloworld')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

# feature 'User signs in' do
#   scenario 'with correct username and password' do
#   end

#   scenario 'with an incorrect username' do
#   end

#   scenario 'with an incorrect password' do
#   end
# end

# feature 'User signs out' do
#   scenario 'while being signed in' do
#   end
# end

# feature 'User forgot his/her password' do
#   scenario 'while knowing his email' do
#   end
# end
