require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User creates peeps' do

  scenario 'which are then viewed on their profile page' do
    sign_up
    add_peep('Peep #1')
    add_peep('Peep #2')
    first(:link, 'Big_G').click
    expect(page).to have_content('Peep #1')
  end

end