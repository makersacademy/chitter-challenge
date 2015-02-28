require 'spec_helper'

feature "User adds a new peep" do
  scenario "add a new peep" do
    visit '/'
    # fill_in 'peep', :with => "this is a short peep"
    # click_button 'Add peep'
    add_peep("this is a short peep")
    expect(Peeps.count).to eq(1)
    peep = Peeps.first
    expect(peep.peep).to eq("this is a short peep")
  end

  def add_peep(text)
    within('#new-peep') do
      fill_in 'peep', :with => text
      click_button 'Add peep'
    end
  end
end