require 'spec_helper'

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'oscar@fierce.com',
                name: 'Oscar Wilde',
                user_name: 'carnation',
                password: 'green',
                password_confirmation: 'green')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'oscar@fierce.com',
                name: 'Oscar Wilde',
                user_name: 'carnation',
                password: 'green',
                password_confirmation: 'green')
  end

  scenario 'while being signed in' do
    sign_in(email: 'oscar@fierce.com', password: 'green')
    click_button 'SIGN OUT'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, oscar@fierce.com')
  end
end
