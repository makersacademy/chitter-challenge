require 'spec_helper'

feature 'Peeping a peep' do

  before :each do
    User.create(name: 'Laszlo', user_name: 'laszlobogacsi',
    email: 'bogacsi.laszlo@gmail.com', password: 'password',
    password_confirmation: 'password')
    log_in(user_name: 'laszlobogacsi', password: 'password')
  end

  scenario 'creating a peep when logged in' do
    fill_in('peep_text', with: 'First peep')
    click_button('Peep!')
    expect(page).to have_content('First peep')
  end
end
