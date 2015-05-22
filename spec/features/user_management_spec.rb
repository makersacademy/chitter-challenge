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
    expect(page).to have_content('Sorry, your passwords do not match')
  end

end