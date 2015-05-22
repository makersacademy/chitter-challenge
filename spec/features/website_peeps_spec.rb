require 'spec_helper'
require_relative 'helpers/peeps'
require_relative 'helpers/user'

include PeepsHelpers

feature 'Feature - Peeps On Website' do

  scenario 'Peep can be added on the website' do
    expect(Peep.count).to eq 0
    sign_up
    add_peep 'My first peep'
    expect(Peep.count).to eq 1
    expect(Peep.first.message).to eq 'My first peep'
    expect(Peep.first.user_name).to eq 'Sanjay Purswani'
    expect(Peep.first.user_handle).to eq 'sanjsanj'
  end

end
