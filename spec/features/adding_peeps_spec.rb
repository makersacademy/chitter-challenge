require 'spec_helper'

feature 'user add new peep' do
  scenario 'when visiting home page' do
    expect(Peep.count).to eq 0
    visit '/'
    add_peep 'Starting from scratch'
    expect(Peep.count).to eq 1
    peep = Peep.first
    expect(peep.content).to eq 'Starting from scratch'
  end

  def add_peep content
    within('#new-peep') do
      fill_in 'content', with: content
      click_button 'Chit'
    end
  end
end
