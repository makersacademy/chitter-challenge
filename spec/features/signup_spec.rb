require 'spec_helper'

feature 'sign up page' do
  scenario 'as a user I can create a new account' do
    visit '/users/signup'
    fill_in(:username, with: 'Mr_X')
    fill_in(:email, with: 'mrx@email.co.uk')
    fill_in(:password, with: 'password')
    fill_in(:password_confirmation, with: 'password')
    click_button('Submit')
    expect(page).to have_content("Lookin' good Mr_X!")
    expect(User.first.email).to eq('mrx@email.co.uk')
    expect(User.count).to eq(1)
  end
end
