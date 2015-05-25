require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User creates peeps' do

  before(:each) do
    sign_up
    add_peep('Peep #1')
  end

  scenario 'which are then viewed on their profile page' do
    click_link('Big_G')
    expect(page).to have_content('Peep #1')
  end

  scenario 'which are then viewed on their profile page with replies' do
    sign_up('Robbo', 'Robert Bentley', 'sample@test.com', 'FirePanda789!', 'FirePanda789!')
    add_reply('Reply #1')
    sign_up('Chazboy', 'Charlie Plummer', 'another@test.com', 'CoolCheetah456!', 'CoolCheetah456!')
    add_reply('Reply #2')
    click_link('Big_G')
    expect(page.first('li:nth-child(2)')).to have_content('Reply #1')
    expect(page.first('li:nth-child(2)')).to have_content('Reply by Robert Bentley (aka Robbo)')
    expect(page.first('li:nth-child(2)')).to have_content(/[A-Z][a-z]{5,8} [123]*[0-9] [A-Z][a-z]{2,8} [0-9]{4} at [1]*[0-9]:[0-5][0-9](A|P)M \([0-5][0-9] secs\)/)
    expect(page.first('li:nth-child(3)')).to have_content('Reply #2')
    expect(page.first('li:nth-child(3)')).to have_content('Reply by Charlie Plummer (aka Chazboy)')
    expect(page.first('li:nth-child(3)')).to have_content(/[A-Z][a-z]{5,8} [123]*[0-9] [A-Z][a-z]{2,8} [0-9]{4} at [1]*[0-9]:[0-5][0-9](A|P)M \([0-5][0-9] secs\)/)
  end

end