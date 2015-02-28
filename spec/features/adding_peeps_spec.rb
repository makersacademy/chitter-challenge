require 'spec_helper'

feature "User adds a new peep" do
  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    visit 'peeps/new'
    add_peep("Bob")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq("Bob")
  end

  def add_peep(content)
    within('#new-peep') do
      fill_in 'content', :with => content
      click_button 'Submit peep'
    end
  end
end