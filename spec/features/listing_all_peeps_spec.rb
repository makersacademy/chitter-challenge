require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User views all peeps' do

  scenario 'when opening the home page' do
    sign_up
    add_peep('Look at my breakfast, lolz')
    visit '/'
    expect(page).to have_content('Look at my breakfast, lolz')
  end

  scenario 'and can see username and name for each peep' do
    sign_up
    add_peep('Look at my breakfast, lolz')
    visit '/'
    expect(page).to have_content('Posted by Andy Gout (aka Big G)')
  end

  scenario 'and can see when each peep was posted' do
    sign_up
    add_peep('Look at my breakfast, lolz')
    visit '/'
    expect(page).to have_content(/[A-Z][a-z]{5,8} [123]*[0-9] [A-Z][a-z]{2,8} [0-9]{4} at [1]*[0-9]:[0-5][0-9](A|P)M \([0-5][0-9] secs\)/)
  end

end