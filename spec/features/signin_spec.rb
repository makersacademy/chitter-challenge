require 'spec_helper'
require_relative 'web_helper'

feature 'sign in page' do
  scenario 'as a user I can sign in' do
    signup
    visit '/users/signin'
    fill_in(:username, with: 'Mr_X')
    fill_in(:password, with: 'password')
    click_button('Submit')
    expect(page).to have_content("Lookin' good Mr_X!")
    expect(User.first.email).to eq('mrx@email.co.uk')
    expect(User.count).to eq(1)
  end
end

#sign in authentication part done. need to sort test.
