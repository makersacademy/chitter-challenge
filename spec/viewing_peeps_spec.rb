require 'spec_helper'
require './app/models/peep'

feature 'Viewing Peeps' do
  scenario 'Previously written peeps are visible on the page' do
    Peep.create(title: 'Hello', message: 'First peep, Ed Balls')
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Ed Balls')
    end
  end
end
