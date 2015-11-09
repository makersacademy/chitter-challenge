require 'web_helper'

feature 'user logs out' do
  scenario 'a user can log out' do
    join
    click_button('Log-out')
    expect(current_path).to eq('/')
    expect(page).to have_content('Join or Log-in')
  end
end
