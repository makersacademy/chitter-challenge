require 'spec_helper'

feature "User adds a new peep" do
  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("my first peep")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("my first peep")
  end

  def add_peep(text)
    within('#new-peep') do
      fill_in 'text', :with => text
      click_button 'Add peep'
    end
  end
end