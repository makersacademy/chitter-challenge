require 'helpers/sign_up_helper'

feature 'log out' do

  scenario 'an existing user logs out of an existing account' do
    sign_up
    click_button "Let's get started"
    click_button('Log out')
    expect(current_path).to eq '/session/new'
    expect(page).to have_content
  end

end
