require 'spec_helper'

feature "So a new user can sign up for Chitter" do
  scenario 'new user enters credentials' do
    visit '/users/new'
    fill_in('name', with: 'James Dix')
    fill_in('username', with: 'jimmygoldshine')
    fill_in('email', with: 'jamesdix@cwgsy.net')
    fill_in('password', with: 'test')
    fill_in('password_confirmation', with: 'test')
    click_button('Sign Up')

    expect(page).to have_content('Welcome to Chitter, James')
  end
end
