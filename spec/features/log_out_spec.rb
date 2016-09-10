require 'spec_helper'

feature 'Log out' do

  scenario 'a user can log out' do
    sign_up('abigail', 'abi@test.com', 'abimcp', 'password123', 'password123')
    click_button('Log out')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'See you again soon!'
    expect(page).not_to have_content 'Welcome, Abigail!'
  end

end
