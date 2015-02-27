require 'spec_helper'

feature "User adds a new peep" do
  scenario "when browsing the homepage" do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("Hello", "greeting")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("Hello")
    expect(peep.tag).to eq("greeting")
  end

  def add_peep(message, tag)
    within('#new-peep') do
      fill_in 'message', :with => message
      fill_in 'tag', :with => tag
      click_button 'Post peep'
    end
  end
end