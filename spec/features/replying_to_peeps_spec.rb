require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User replies to peep of another user' do

  before(:each) do
    sign_up
    add_peep('Peep #1')
    sign_up('Robbo', 'Robert Bentley', 'sample@test.com', 'FirePanda789!', 'FirePanda789!')
    add_reply('Reply #1')
    add_reply('Reply #2')
  end

  scenario 'when on the home page' do
    expect(page).to have_content('Reply #1')
  end

  scenario 'with username and name for each reply' do
    expect(page.first('li ul li')).to have_content('Reply by Robert Bentley (aka Robbo)')
  end

  scenario 'with timestamp of when reply was posted' do
    expect(page.first('li ul li')).to have_content(/[A-Z][a-z]{5,8} [123]*[0-9] [A-Z][a-z]{2,8} [0-9]{4} at [1]*[0-9]:[0-5][0-9](A|P)M \([0-5][0-9] secs\)/)
  end

  scenario 'and sees replies displayed in chronological order' do
    expect(page).to have_selector('li ul li:nth-child(1)', text: 'Reply #1')
    expect(page).to have_selector('li ul li:nth-child(2)', text: 'Reply #2')
  end

end