require 'spec_helper'

RSpec.feature 'User can sign out' do

  let!(:user) do
    User.create(name: 'Sally Went',
                user_name: 'sallywent1990',
                email: 'sillysally@yahoo.com',
                password: 'ginger123',
                password_confirmation: 'ginger123')
  end

  scenario 'users signs out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('Cheers for using Chitter. Peace out.')
    expect(page).not_to have_content('Howdy, sallywent1990')
  end

  scenario 'sign in with another user after sing out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    click_button 'Sign in'

    expect(page).to have_content('Sign in to start Chittering')
  end
end
