require 'spec_helper'


feature 'log in' do

  before :each do
    User.create(name: 'Laszlo', user_name: 'laszlobogacsi',
    email: 'bogacsi.laszlo@gmail.com', password: 'password',
    password_confirmation: 'password')
  end

  scenario 'when user has the correct credentials' do
    log_in(user_name: 'laszlobogacsi', password: 'password')
    expect(page).to have_content('Welcome, Laszlo')
  end

  scenario 'when wrong email or password is given' do
    log_in(user_name: 'laszlobogacsi', password: 'wrongpassword')
    expect(page).to have_content('Incorrect username or password')
  end

end
