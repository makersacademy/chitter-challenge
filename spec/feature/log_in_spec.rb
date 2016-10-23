require 'spec_helper'

feature 'log in' do
  scenario 'when user has the correct credentials' do
    User.create(name: 'Laszlo', user_name: 'laszlobogacsi', email: 'bogacsi.laszlo@gmail.com', password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Log in'
    fill_in('user_name', with: 'laszlobogacsi')
    fill_in('password', with: 'password')
    click_button('Log in!')
    expect(page).to have_content('Welcome, Laszlo')
  end

  scenario 'when wrong email or password is given' do
    User.create(name: 'Laszlo', user_name: 'laszlobogacsi', email: 'bogacsi.laszlo@gmail.com', password: 'password', password_confirmation: 'password')
    visit '/'
    click_link 'Log in'
    fill_in('user_name', with: 'laszlobogacsi')
    fill_in('password', with: 'wrongpassword')
    click_button('Log in!')
    expect(page).to have_content('Incorrect username or password')
  end

end
