require 'spec_helper'

feature 'Log out' do
  scenario 'when logged in'do
  User.create(name: 'Laszlo', user_name: 'laszlobogacsi', email: 'bogacsi.laszlo@gmail.com', password: 'password', password_confirmation: 'password')
  visit '/'
  click_link 'Log in'
  fill_in('user_name', with: 'laszlobogacsi')
  fill_in('password', with: 'password')
  click_button('Log in!')
  click_button('Log out')
  expect(page).to have_content('Good bye')
  expect(page).not_to have_content('Welcome, Laszlo!')
  end
end
