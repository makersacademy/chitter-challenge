require 'spec_helper'
require "./app/models/peep.rb"

feature 'Adding new peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in :title, :with => 'Hello'
    fill_in :message, :with => 'First peep, Ed Balls'
    click_button 'Add Peep'
    visit '/peeps'
    expect(page).to have_content('First peep, Ed Balls')
  end
end
