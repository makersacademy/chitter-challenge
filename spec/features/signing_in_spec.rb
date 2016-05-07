require 'spec_helper'

feature 'Signing in' do
	let(:user) do
    User.create(name: 'Ana mile', username: 'anamile', email: 'ana@mile.com',
      password: '123', password_confirmation: '123')
  end

  scenario 'user can sign in with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

end