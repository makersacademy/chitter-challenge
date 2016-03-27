require 'web_helper'
feature 'User signs out' do
  include Helpers
  before(:each) do
    User.create(name: 'jon',
                username: 'ghost',
                email: 'jon_snow@nightswatch.com',
                password: 'ygritte',
                password_confirmation: 'ygritte')
  end

  scenario 'while being signed in' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome to Chitter, ghost!")
  end

end
