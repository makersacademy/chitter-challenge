require 'helpers'

feature 'Chitter User sign up' do
  include Helpers
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, @JonesL')
    expect(User.first.name).to eq('Lisa Jones')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
