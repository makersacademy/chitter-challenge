require 'spec_helper'

feature 'Signing Up ' do

  scenario 'I can create a new user acount' do
    visit '/users/new'
    fill_in 'name',   with: 'Jon'
    fill_in 'email', with: 'jon@example.com'
    click_button 'Create Account'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Jon'
  end
end