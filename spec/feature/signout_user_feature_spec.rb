require 'spec_helper'
require 'web_helpers'
require './app/chitter.rb'

feature 'Siging out' do

  before do
    sign_up
    sign_in
    click_button('Sign out')
  end

 scenario 'I can sign out from the home page after siging in' do
  expect(current_path).to eq '/'
  expect(page).to have_content('Goodbye!')
  expect(page).not_to have_content('Welcome, Rachel')
 end

 scenario 'I cannot create a new peep after sign out' do
  expect(page).to have_content('Goodbye!')
  expect(page).not_to have_content('New peep!')
 end


end
