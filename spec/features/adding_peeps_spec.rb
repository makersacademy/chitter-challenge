require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User adds a new peep' do

  scenario 'when browsing the homepage' do
    expect(Peep.count).to eq(0)
    sign_up
    add_peep('Peep #1')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq('Peep #1')
  end

end