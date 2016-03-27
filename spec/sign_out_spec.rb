require 'spec_helper'

feature 'User signs out' do

  before do
    User.create(
    email: 'joe@example.com',
    password: 'joe123',
    name: 'joe',
    username: 'joem',
    )
  end

  scenario 'can sign out in' do
    visit '/users/new'
    fill_in :email, with: 'joe@example.com'
    fill_in :password, with: '123'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content 'goodbye'
  end
end
