require 'spec_helper'

feature 'User signs out' do

  before(:each) do
    User.create(name: "Abigail Johnson", email: 'abigail@gmail.com', user_name: "Ab", password: '1234', password_confirmation: '1234')
  end

  scenario 'while being signed in' do
    sign_in(email: 'abigail@gmail.com', password: '1234')
    click_button('Sign out')
    expect(page).to have_content('Have a nice day!')
    expect(page).not_to have_content('Welcome, abigail@gmail.com')
  end

end
