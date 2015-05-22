require 'spec_helper'

feature 'User adds a new blabb' do

  scenario 'when browsing the homepage' do
    expect(Blabbs.count).to eq(0)
    visit '/blabbs/new'
    add_blabbs('Sample blabb message here')
    expect(Blabbs.count).to eq(1)
    blabbs = Blabbs.first
    expect(blabbs.message).to eq('Sample blabb message here')
  end

  def add_blabbs(message)
    within('#new-blabb') do
      fill_in 'message', with: message
      click_button 'Add blabb'
    end
  end
end
