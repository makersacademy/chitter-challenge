require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do

  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Andy Gout (aka Big G)')
    expect(User.first.email).to eq('example@test.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up('Big G', 'Andy Gout', 'example@test.com', 'pass', 'no_match') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is already registered' do
    expect { sign_up('Big G', 'Andy Gout', 'example@test.com') }.to change(User, :count).by(1)
    expect { sign_up('Robbo', 'Robert Gout', 'example@test.com') }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'with a username that is already registered' do
    expect { sign_up('Big G') }.to change(User, :count).by(1)
    expect { sign_up('Big G') }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

end