# frozen_string_literal: true
require_relative '../spec_helper.rb'

feature 'chitter' do
  scenario 'Add peep button will show the peep in the page body' do
    visit('/')
    fill_in 'new_peep', with: 'This is a new peep'
    click_button 'Submit'

    expect(page).to have_content('This is a new peep')
  end

  scenario 'Adding a new peep will still show old peeps' do
    visit('/')
    fill_in 'new_peep', with: 'This is a new peep'
    click_button 'Submit'
    fill_in 'new_peep', with: 'This is a second peep'
    click_button 'Submit'

    expect(page).to have_content('This is a new peep')
  end
end
