require 'spec_helper'

feature 'Adding a new peep' do
  scenario 'A user can add a new peep to Peep db' do
    visit('/create_peep')
    fill_in('Peep', with: 'Test peep')
    click_button('Peep peep')
    # expect(page).to have_content('Test title', 'Test peep')
  end

  # scenario 'The bookmark must be a valid URL' do
  #   visit('/bookmarks/new')
  #   fill_in('title', with: 'not a real bookmark')
  #   fill_in('url', with: 'not a real bookmark')
  #   click_button('Submit')

  #   expect(page).not_to have_content "not a real bookmark"
  #   expect(page).to have_content "Please submit a valid URL"
  # end
end