require 'spec_helper'
require './app'

feature 'peep' do
  scenario 'to post' do
    visit('/')

    fill_in 'username', with: 'ravensears'
    fill_in 'peep', with: 'Watching The Office!'
    fill_in 'chittered_on', with: '20221601'
    click_button
        
    expect(page).to have_content 'ravensears'
  end

  scenario 'prints peeps in reverse chronological order' do
    visit('/peeps')

    expect(page).to have_content '1'
  end

  scenario 'shows time is was created' do
    visit('/peeps')

    expect(page).to have_content '20221601'
  end
end
