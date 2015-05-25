require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do 

  scenario 'when being the user visiting the site' do 
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Tim')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

end

feature 'User signs in' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test',
                name: 'Testname',
                username: 'Testusername')
  end

  scenario 'with correct credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, Testname')
    sign_in('test@test.com', 'test')
    expect(page).to have_content('Welcome, Testname')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, Testname')
    sign_in('test@test.com', 'wrong')
    expect(page).not_to have_content('Welcome, Testname')
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test',
                name: 'Testname',
                username: 'Testusername')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button 'Sign out'
    expect(page).to have_content('Good bye!') # where does this message go?
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end

feature 'User forgets password' do

  let(:user) { User.create(email: 'test@test.com', password: 'test', 
    password_confirmation: 'test', name: 'Testname', username: 'Testusername') }

  before do
    user
  end

  scenario 'User requests replacement password' do
    visit '/sessions/new'
    expect(page).to have_content('Forgot password?')
    within '#forgot' do
      fill_in :email, with: user.email
    end

    expect(Chitter::Application.email_handler).to receive(:send_email_to).with(anything)

    click_button 'Request new password'
    expect(page).to have_content('Password recovery e-mail sent!')
  end
end
