require 'spec_helper'

feature 'Log out' do

  before :each do
    User.create(name: 'Laszlo', user_name: 'laszlobogacsi',
    email: 'bogacsi.laszlo@gmail.com', password: 'password',
    password_confirmation: 'password')
    log_in(user_name: 'laszlobogacsi', password: 'password')
  end

  scenario 'when logged in user can log out'do
    click_button('Log out')
    expect(page).to have_content('Good bye')
    expect(page).not_to have_content('Welcome, Laszlo!')
  end
end
