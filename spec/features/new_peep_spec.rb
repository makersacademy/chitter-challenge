require 'spec_helper'

RSpec.feature 'New peep' do

  scenario "- peeps can be created" do
    visit '/peeps/new'
    fill_in :content, with: 'test'
    click_button 'Send'
    expect(Peep.count).to eq 1
  end

end
