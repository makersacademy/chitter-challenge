require 'spec_helper'


feature 'users can Sign Up and Sign In' do
  scenario 'see a Sign up page' do
    visit '/users/new'
    expect(page).to have_content 'Sign up for Chitter'
  end

  # scenario 'sign up' do
  #   visit '/'
  #   fill_in :email, with: 'diegoregules@gmail.com'
  #   fill_in :passwword, with: '12345'
  #   click_button 'Sign Up'
  #   expect
  # end
end