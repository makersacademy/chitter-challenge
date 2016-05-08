require 'spec_helper'

feature 'Signing out' do
  before(:each) do
    User.create(name: 'Foo Bar',
      username: 'fooby',
      email: 'foo@bar.com',
      password: 'foobar',
      password_confirmation: 'foobar')
  end

  scenario 'user can sign out while being signed in' do
    sign_in(email: 'foo@bar.com',   password: 'foobar')
    click_button 'Sign out'
    expect(page).to have_content('See you soon!')
    expect(page).not_to have_content('Welcome, Foo Bar')    
  end

end