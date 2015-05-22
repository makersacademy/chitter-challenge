require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do

  scenario 'when being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Andy Gout (aka Big G)')
    expect(User.first.email).to eq('example@test.com')
  end

end