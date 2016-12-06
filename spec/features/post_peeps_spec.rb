require 'spec_helper'

feature 'post peep' do

  def new_peep
    visit '/new_peep'
    fill_in :message, with: 'Hello, this is a test peep'
    click_button 'Add Peep'
  end

  scenario 'user can post a message' do
    new_peep
    expect(page).to have_content "Hello, this is a test peep"
  end
end
