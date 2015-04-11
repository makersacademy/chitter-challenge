require 'spec_helper'
require_relative 'helpers/peeps'

include PeepsHelpers

feature 'Feature - Peeps Database' do

  peep = Peep.first

  scenario 'Peep can be added to the database' do
    expect(Peep.count).to eq 0
    visit '/'
    add_peep 'My first peep'
    expect(Peep.count).to eq 1
    expect(peep.message).to eq 'My first peep'
    # expect(peep.user_name).to eq 'Sanjay Purswani'
    # expect(peep.user_handle).to eq 'sanjsanj'
  end

end
