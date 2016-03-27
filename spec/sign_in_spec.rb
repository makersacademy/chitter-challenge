require 'spec_helper'

feature 'User can sign in' do

  before do
    User.create(
      email: 'joe@example.com',
      password: 'joe123',
      name: 'joe',
      username: 'joem'
    )
  end
#
  scenario 'With correct password and email' do
    visit 'sessions/new'
    fill_in :email, with: 'joe@example.com'
    fill_in :password, with: 'joe123'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome joem'
  end
end
