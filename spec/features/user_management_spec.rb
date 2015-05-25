require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do

  scenario 'when being the user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, uhoh@danieljohnston.co.uk')
    expect(User.first.email).to eq('uhoh@danieljohnston.co.uk')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('a@a.com', 'handle', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, there were the following problems with the form.')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up('a@a.com','myhandle') }.to change(User, :count).by(1)
    expect { sign_up('a@a.com','myotherhandle') }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end

  scenario 'with a handle that is already registered' do
    expect { sign_up('a@a.com','myhandle') }.to change(User, :count).by(1)
    expect { sign_up('b@b.com','myhandle') }.to change(User, :count).by(0)
    expect(page).to have_content('This handle is taken')
  end
end

feature 'User logs in' do

  before(:each) do
    User.create(email: 'uhoh@danieljohnston.co.uk',
                handle: 'uhoh',
                password: 'testpassword',
                password_confirmation: 'testpassword')
  end

  scenario 'when starting at the login page' do
    visit '/'
    expect(page).not_to have_content('Welcome, uhoh@danieljohnston.co.uk')
    sign_in('uhoh@danieljohnston.co.uk', 'testpassword')
    expect(page).to have_content('Welcome, uhoh@danieljohnston.co.uk')
  end

  scenario 'with incorrect credentials' do
    visit '/'
    expect(page).not_to have_content('Welcome, uhoh@danieljohnston.co.uk')
    sign_in('uhoh@danieljohnston.co.uk', 'wrong')
    expect(page).not_to have_content('Welcome, uhoh@danieljohnston.co.uk')
  end

end
