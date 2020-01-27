require 'spec_helper'
require 'web_helper'

feature 'Post peep' do
  scenario 'allows user to post peep' do
    sign_up
    fill_in 'Chitter chat...', with: 'This is my first peep #excited !!'
    click_button 'Post'
    expect(page).to have_content('This is my first peep #excited !!')
  end
end