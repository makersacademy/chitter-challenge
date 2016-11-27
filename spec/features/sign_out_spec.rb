require 'spec_helper'

feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    sign_in
    click_button('Sign out')
    expect(page).to have_content('Have a nice day!')
    expect(page).not_to have_content('Welcome, abigail@gmail.com')
  end

end
