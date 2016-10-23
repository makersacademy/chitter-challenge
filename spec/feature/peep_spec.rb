require 'spec_helper'

feature 'Peeping a peep' do
  scenario 'creating a peep' do
    User.create(name: 'Laszlo', user_name: 'laszlobogacsi', email: 'bogacsi.laszlo@gmail.com', password: 'password', password_confirmation: 'password')

    visit '/'
    click_link 'Log in'
    fill_in('user_name', with: 'laszlobogacsi')
    fill_in('password', with: 'password')
    click_button('Log in!')
    fill_in('peep_text', with: 'First peep')
    click_button('Peep!')
    save_and_open_page
    expect(page).to have_content('First peep')
  end
end
