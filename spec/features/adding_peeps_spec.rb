require 'spec_helper'
require 'tilt/erb'
require_relative 'helpers/session'

include SessionHelpers

feature 'User submits a new peep' do 
  scenario 'when browsing the homepage' do 
    sign_up
    expect(Peep.count).to eq(0)
    visit '/peeps/new'
    expect(page).to have_content('Peep:')
    add_peep('this is a peep')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq('this is a peep')
    # peep.destroy
    # expect(Peep.count).to eq(0)
  end

end