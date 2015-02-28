require 'spec_helper'

feature 'user adds a new peep' do
  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("Just adding a peep", DateTime.now)
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq ("Just adding a peep")
  end

  def add_peep(content,time=DateTime.now)
    within('#new-peep') do
      fill_in 'content', :with => content
      click_button 'Peep!'
    end
  end

end