require 'spec_helper'
require "./app/models/peep"

feature 'Adding new peeps' do

  scenario 'I can create a new peep' do
    sign_up
    log_in
    visit '/peeps/new'
    fill_in 'title', :with => 'Hello'
    fill_in 'message', :with => 'First peep, Ed Balls'
    click_button 'Add Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('First peep, Ed Balls')
    end
  end
end
