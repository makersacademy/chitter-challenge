require 'spec_helper'

feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Simona')
    fill_in('username', with: 'Airies')
    fill_in('email', with: 'simona.gioe88@gmail.com')
    fill_in('password', with: 'Password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, Simona'
  end
end
