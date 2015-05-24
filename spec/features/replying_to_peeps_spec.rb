require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User replies to peep of another user' do

  before(:each) do
    sign_up
    add_peep('Peep #1')
    sign_up('Robbo', 'Robert Bentley', 'sample@test.com', 'PandaFire123!', 'PandaFire123!')
    click_link('Reply')
    fill_in :text, with: 'Reply #1'
    click_button('Reply!')
  end

  scenario 'when on the home page' do
    expect(page).to have_content('Reply #1')
  end

  # scenario 'with username and name for each peep' do
  #   expect(page).to have_content('Posted by Andy Gout (aka Big_G)')
  # end

  # scenario 'with timestamp of when each peep was posted' do
  #   expect(page).to have_content(/[A-Z][a-z]{5,8} [123]*[0-9] [A-Z][a-z]{2,8} [0-9]{4} at [1]*[0-9]:[0-5][0-9](A|P)M \([0-5][0-9] secs\)/)
  # end

  # scenario 'in reverse chronology' do
  #   expect(page).to have_selector('li:nth-child(1)', text: 'Peep #2')
  # end

end