require 'spec_helper'
require_relative 'helpers/peeps'

include PeepsHelpers

feature 'Feature - Peeps Database' do

  scenario 'Peep can be added to the database' do
    expect(Peep.count).to eq 0
    visit '/'
    p '---' * 10
    p Peep.first
    add_peep 'My first peep'
    p Peep.first
    expect(Peep.count).to eq 1
    expect(Peep.first.message).to eq 'My first peep'
    expect(Peep.first.user_name).to eq 'Sanjay Purswani'
    expect(Peep.first.user_handle).to eq 'sanjsanj'
  end

end
