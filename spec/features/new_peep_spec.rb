require 'spec_helper'

RSpec.feature 'New peep' do

  scenario "- peeps can be created" do
    Peep.create(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
    expect(Peep.count).to eq 1
  end

end
