require 'spec_helper'

feature 'user adds a new peep' do
  # scenario "when browsing the homepage" do
  #   expect(Peep.count).to eq(0)
  #   visit '/'
  #   add_peep("Just adding a peep", DateTime.now)
  #   expect(Peep.count).to eq(1)
  #   peep = Peep.first
  #   expect(peep.content).to eq ("Just adding a peep")
  # end

  scenario "adding a user to the peep" do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("Just adding a peep", "Chris", DateTime.now)
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.author).to eq("Chris")
  end

  def add_peep(content, author, time=DateTime.now)
    within('#new-peep') do
      fill_in 'content', :with => content
      fill_in 'author', :with => author
      click_button 'Peep!'
    end
  end

end