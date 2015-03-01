require 'spec_helper'

feature "User adds a new peep" do

  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("programming is fun")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("programming is fun")
  end

  def add_peep(message)
    within('#new-peep') do
      fill_in 'message',:with => message
      click_button 'Add peep'
    end
  end
end